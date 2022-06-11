import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../mock/video.dart';

typedef LoadMoreVideo = Future<List<VPVideoController>> Function(
  int index,
  List<VPVideoController> list,
);

typedef ControllerSetter<T> = Future<void> Function(T controller);
typedef ControllerBuilder<T> = T Function();

// -----------
class TikTokVideoListController extends ChangeNotifier {
//TODO 待完成

  /// 到第几个触发预加载，例如：1:最后一个，2:倒数第二个
  final int loadMoreCount;
  final int preloadCount;
  final int disposeCount;

  TikTokVideoListController({
    this.loadMoreCount = 1,
    this.preloadCount = 3,
    this.disposeCount = 5,
  });

  LoadMoreVideo? _videoProvider;

  //当前视频序号
  ValueNotifier<int> index = ValueNotifier<int>(0);

// 视频列表
  List<VPVideoController> playerList = [];

  VPVideoController get currentPlayer => playerList[index.value];

  /// 视频总数目
  int get videoCount => playerList.length;

  init(
      {required PageController pageController,
      required List<VPVideoController> initialList,
      required LoadMoreVideo videoProvider}) async {
    playerList.addAll(initialList);
    _videoProvider = videoProvider;
    pageController.addListener(() {
      var p = pageController.page!;
      if (p % 1 == 0) {
        loadIndex(p ~/ 1);
      }
    });

    loadIndex(0, reload: true);
    notifyListeners();
  }

  void dispose() {
    for (var player in playerList) {
      player.showPauseIcon.dispose();
      player.dispose();
    }
    playerList = [];
    super.dispose();
  }

  loadIndex(int target, {bool reload = false}) {
    if (!reload) {
      if (index.value == target) {
        return;
      }
    }

    var oldIndex = index.value;
    var newIndex = target;

    if (!(oldIndex == 0 && newIndex == 0)) {
      playerOfIndex(oldIndex)?.controller.seekTo(Duration.zero);
      playerOfIndex(oldIndex)?.pause();
    }

    VPVideoController? newVideoController = playerOfIndex(newIndex);
    newVideoController?.controller.addListener(_didUpdateValue);
    newVideoController?.showPauseIcon.addListener(_didUpdateValue);
    newVideoController?.play();

    for (var i = 0; i < playerList.length; i++) {
      //需要释放
      if (i < newIndex - disposeCount || i > newIndex + disposeCount) {
        VPVideoController? vpC = playerOfIndex(i);
        vpC?.controller.removeListener(_didUpdateValue);
        vpC?.showPauseIcon.removeListener(_didUpdateValue);
        vpC?.dispose();
      } else {
        if (i > newIndex && i < newIndex + preloadCount) {
          playerOfIndex(i)?.init();
        }
      }
    }

    if (playerList.length - newIndex <= loadMoreCount + 1) {
      _videoProvider?.call(newIndex, playerList).then((list) async {
        playerList.addAll(list);
      });
    }

    index.value = target;
  }

  _didUpdateValue() {
    notifyListeners();
  }

  VPVideoController? playerOfIndex(int index) {
    if (index < 0 || index > playerList.length - 1) {
      return null;
    }
    return playerList[index];
  }
}

// -----------
// 抽象类
abstract class TikTokVideoController<T> {
  T get controller;

  ValueNotifier<bool> get showPauseIcon;

  Future<void> init({ControllerSetter<T> afterInit});
  Future<void> dispose();
  Future<void> play();
  Future<void> pause({bool showPauseIcon: false});
}

// -----------
class VPVideoController extends TikTokVideoController<VideoPlayerController> {
  VideoPlayerController? _controller;
  ValueNotifier<bool> _showPauseIcon = ValueNotifier<bool>(false);
  final UserVideo? videoInfo;
  final ControllerBuilder<VideoPlayerController> _builder;
  final ControllerSetter<VideoPlayerController>? _afterInit;

  VPVideoController(
    this.videoInfo,
    ControllerBuilder<VideoPlayerController> builder,
    ControllerSetter<VideoPlayerController>? afterInit,
  )   : this._builder = builder,
        this._afterInit = afterInit;

  @override
  VideoPlayerController get controller {
    if (_controller == null) {
      _controller = _builder.call();
    }
    return _controller!;
  }

  Completer<void>? _disposeLock;

  List<Future> _actLocks = [];
  bool get isDispose => _disposeLock != null;
  bool get prepared => _prepared;
  bool _prepared = false;

  @override
  ValueNotifier<bool> get showPauseIcon => _showPauseIcon;

  @override
  Future<void> init(
      {ControllerSetter<VideoPlayerController>? afterInit}) async {
    if (prepared) {
      return;
    }

    await Future.wait(_actLocks);
    _actLocks.clear();
    var completer = Completer<void>();
    _actLocks.add(completer.future);

    await this.controller.initialize();
    await this.controller.setLooping(true);

    afterInit ??= this._afterInit;

    _prepared = true;
    completer.complete();

    if (_disposeLock != null) {
      _disposeLock?.complete();
      _disposeLock = null;
    }
  }

  @override
  Future<void> play() async {
    await Future.wait(_actLocks);
    _actLocks.clear();

    await init();
    if (!prepared) {
      return;
    }

    if (_disposeLock != null) {
      await _disposeLock?.future;
    }

    await this.controller.play();
    _showPauseIcon.value = false;
  }

  @override
  Future<void> pause({bool showPauseIcon = false}) async {
    await Future.wait(_actLocks);
    _actLocks.clear();

    await init();
    if (!prepared) {
      return;
    }

    if (_disposeLock != null) {
      await _disposeLock?.future;
    }

    await this.controller.pause();
    _showPauseIcon.value = true;
  }

  @override
  Future<void> dispose() async {
    if (!prepared) {
      return;
    }
    await Future.wait(_actLocks);
    _actLocks.clear();
    var completer = Completer<void>();
    _actLocks.add(completer.future);
    _prepared = false;

    await this.controller.dispose();
    _controller = null;
    _disposeLock = Completer<void>();
    completer.complete();
  }
}
