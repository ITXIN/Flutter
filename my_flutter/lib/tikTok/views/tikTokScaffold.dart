import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// import 'package:my_flutter/style/style.dart';
import 'package:my_flutter/tikTok/style/style.dart';
import 'package:my_flutter/unit/global_constant.dart';

const double scrollSpeed = 300;

enum TikTokPagePosition {
  left,
  right,
  middle,
}

class TikTokScaffoldController extends ValueNotifier<TikTokPagePosition> {
  TikTokScaffoldController([
    TikTokPagePosition value = TikTokPagePosition.middle,
  ]) : super(value);

  Future Function(TikTokPagePosition pagePositon)? _onAnimateToPage;

  Future? animateToPage(TikTokPagePosition pagePosition) {
    return _onAnimateToPage?.call(pagePosition);
  }

  Future? animateToLeft() {
    return _onAnimateToPage?.call(TikTokPagePosition.left);
  }

  Future? animateToRight() {
    return _onAnimateToPage?.call(TikTokPagePosition.right);
  }

  Future? animateToMiddle() {
    return _onAnimateToPage?.call(TikTokPagePosition.middle);
  }
}

class TikTokScaffold extends StatefulWidget {
  final TikTokScaffoldController? controller;

  final Widget? header;

  final Widget? tabBar;

  final int currentIndex;

  final bool hasBottomPadding;
  final bool? enableGesture;

  final Widget? page;

  final Function()? onPullDownRefresh;

  const TikTokScaffold({
    Key? key,
    this.header,
    this.tabBar,
    this.hasBottomPadding: false,
    this.page,
    this.currentIndex: 0,
    this.enableGesture,
    this.onPullDownRefresh,
    this.controller,
  }) : super(key: key);

  @override
  _TikTokScaffoldState createState() => _TikTokScaffoldState();
}

class _TikTokScaffoldState extends State<TikTokScaffold>
    with TickerProviderStateMixin {
  AnimationController? animationControllerX;
  AnimationController? animationControllerY;
  late Animation<double> animationX;
  late Animation<double> animationY;
  double offsetX = 0.0;
  double offsetY = 0.0;
  // int currentIndex = 0;
  double inMiddle = 0;

  @override
  void initState() {
    // widget.controller._onAnimateToPage = ani
    super.initState();
  }

  // double screenWidth = Global.screenWidth;
  // Future animateToPage(p) async {
  //   if (screenWidth == null) {
  //     return null;
  //   }

  //   switch (p) {
  //     case TikTokPagePosition.left:
  //       await animateToPage(p)
  //       break;
  //     default:
  //   }
  // }

  // Future animateTo([double end = 0.0]) {
  //   final curve = cur
  // }

  // CurvedAnimation curvedAnimation(){

  // }

  @override
  Widget build(BuildContext context) {
    Widget body = Stack(
      children: <Widget>[],
    );

    body = GestureDetector(
      onVerticalDragUpdate: calculateOffsetY,
      onVerticalDragEnd: (_) async {
        if (!widget.enableGesture!) {
          return;
        }

        absorbing = false;
        if (offsetY != 0) {
          await animateToTop();
          widget.onPullDownRefresh?.call();
          setState(() {});
        }
      },
      child: body,
      // onHorizontalDragEnd: (details)=>,
    );

    body = WillPopScope(
        child: Scaffold(
          body: body,
          backgroundColor: Colors.black,
          resizeToAvoidBottomInset: false,
        ),
        onWillPop: () async {
          if (!widget.enableGesture!) {
            return true;
          }
          if (inMiddle == 0) {
            return true;
          }

          widget.controller?.animateToMiddle();
          return false;
        });

    return body;
  }

  // Future? animateToMiddle() {
  //   return _onAnimateToPage?.call(TikTokPagePosition.middle);
  // }

  Future animateToTop() {
    animationControllerY = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: offsetY.abs() * 1000 ~/ 60));
    final curve = CurvedAnimation(
        parent: animationControllerY!, curve: Curves.easeOutCubic);

    animationY = Tween(begin: offsetY, end: 0.0).animate(curve
      ..addListener(() {
        setState(() {
          offsetY = animationY.value;
        });
      }));

    return animationControllerY!.forward();
  }

  // double offsetX = 0.0;
  // double offsetY = 0.0;
  // // int currentIndex = 0;
  // double inMiddle = 0;

  bool absorbing = false;
  double endOffset = 0.0;

  /// 计算[offsetY]
  ///
  /// 手指上滑,[absorbing]为false，不阻止事件，事件交给底层PageView处理
  /// 处于第一页且是下拉，则拦截滑动���件
  void calculateOffsetY(DragUpdateDetails details) {
    if (!widget.enableGesture!) return;
    if (inMiddle != 0) {
      setState(() => absorbing = false);
      return;
    }
    final tempY = offsetY + details.delta.dy / 2;
    if (widget.currentIndex == 0) {
      // absorbing = true; // TODO:暂时屏蔽了下拉刷新
      if (tempY > 0) {
        if (tempY < 40) {
          offsetY = tempY;
        } else if (offsetY != 40) {
          offsetY = 40;
          // vibrate();
        }
      } else {
        absorbing = false;
      }
      setState(() {});
    } else {
      absorbing = false;
      offsetY = 0;
      setState(() {});
    }
    print(absorbing.toString());
  }
}

class _MiddlePage extends StatelessWidget {
  final bool? absorbing;
  final bool isStack;
  final Widget? page;

  final double? offsetX;
  final double? offsetY;
  final Function? onTopDrag;

  final Widget? header;
  final Widget? tabBar;

  const _MiddlePage({
    Key? key,
    this.absorbing,
    this.onTopDrag,
    this.offsetX,
    this.offsetY,
    this.isStack: false,
    required this.header,
    required this.tabBar,
    this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget tabBarContainer = tabBar ??
        Container(
          height: 44,
          child: Placeholder(
            color: Colors.red,
          ),
        );
    Widget mainVideoList = Container(
      color: ColorPlate.back1,
      padding: EdgeInsets.only(
        bottom: isStack ? 0 : 44 + MediaQuery.of(context).padding.bottom,
      ),
      child: page,
    );
    // 刷新标志
    Widget _headerContain;
    if (offsetY! >= 20) {
      _headerContain = Opacity(
        opacity: (offsetY! - 20) / 20,
        child: Transform.translate(
          offset: Offset(0, offsetY!),
          child: Container(
            height: 44,
            child: Center(
              child: const Text(
                "下拉刷新内容",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SysSize.normal,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      _headerContain = Opacity(
        opacity: max(0, 1 - offsetY! / 20),
        child: Transform.translate(
          offset: Offset(0, offsetY!),
          child: SafeArea(
            child: Container(
              height: 44,
              child: header ?? Placeholder(color: Colors.green),
            ),
          ),
        ),
      );
    }

    Widget middle = Transform.translate(
      offset: Offset(offsetX! > 0 ? offsetX! : offsetX! / 5, 0),
      child: Stack(
        children: <Widget>[
          Container(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                mainVideoList,
                tabBarContainer,
              ],
            ),
          ),
          _headerContain,
        ],
      ),
    );

    if (page is! PageView) {
      return middle;
    }

    return AbsorbPointer(
      absorbing: absorbing!,
      child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowGlow();
            return;
          } as bool Function(OverscrollIndicatorNotification)?,
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.direction == ScrollDirection.idle &&
                  notification.metrics.pixels == 0.0) {
                onTopDrag?.call();
                return false;
              }
              return true;
            },
            child: middle,
          )),
    );
  }
}
