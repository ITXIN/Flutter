import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:my_flutter/dy/bloc.dart';

void main() {
  //https://blog.csdn.net/jdsjlzx/article/details/123545142
  // https://www.jianshu.com/p/6994f65be6f9
  WidgetsFlutterBinding.ensureInitialized();
  //强制竖屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
  if (Platform.isAndroid) {
    //设置安卓导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  Route<dynamic>? _getRoute(RouteSettings settings) {
    Map<String, WidgetBuilder> routes = {
      '/': (BuildContext context) {
        return Center(
          child: Text("dddd"),
        );
      },
      // '':(context) => ,
      // '':(context) => ,
      // '':(context) => ,
      '/webView': (BuildContext context) {
        Map arg = settings.arguments as Map;
        return WebviewScaffold(
          url: arg['url'],
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.red,
            toolbarTextStyle: TextStyle(color: Colors.white, fontSize: 18),
            title: Text(arg['title']),
          ),
        );
      },
    };

    var widget = routes[settings.name];
    if (widget != null) {
      return MaterialPageRoute(builder: widget, settings: settings);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => BlocObj.counter,
        ),
        BlocProvider<IndexBloc>(
          create: (context) => BlocObj.index,
        ),
      ],
      child: MaterialApp(
        title: "斗鱼Flutter",
        theme: ThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
            primarySwatch: Colors.orange,
            textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
            appBarTheme: AppBarTheme(
              toolbarTextStyle: TextStyle(color: Colors.black, fontSize: 18.0),
            )),
        onGenerateRoute: _getRoute,
      ),
    );
  }
}
