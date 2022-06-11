import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter/dy/bloc.dart';
import 'package:my_flutter/dy/httpUrl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SharedPreferences prefs;

  void _initAsync() async {
    // App启动时读取Sp数据，需要异步等待Sp初始化完成。
    prefs = await SharedPreferences.getInstance();
  }

  void _getNav() {
    final indexBloc = BlocProvider.of<IndexBloc>(context);

    httpClient.get(API.nav).then((value) {
      var navList = value.data['data'];
      indexBloc.add(UpdateTab(navList));
    });
  }

  void _getSwiperPic() {
    final indexBloc = BlocProvider.of<IndexBloc>(context);
    httpClient
        .post(API.swiper,
            data: FormData.fromMap({'num': 4}),
            options: buildCacheOptions(Duration(minutes: 30)))
        .then((value) {
      var swiper = value.data['data'];
      indexBloc.add(UpdateSwiper(swiper));
    }).catchError((error) {
      // indexBloc.add(UpdateSwiper(null));
    });
  }

  void _initLiveData() async {
    final indexBloc = BlocProvider.of<IndexBloc>(context);
    // var liveList = await DYSe
  }

  @override
  void initState() {
    super.initState();
    _initAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
