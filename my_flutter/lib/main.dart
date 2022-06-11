import 'dart:io';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
// import 'package:my_flutter/list.dart';
// import 'package:my_flutter/page/anmation.dart';
// import 'package:my_flutter/page/move_game_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    // 强制竖屏
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  if (Platform.isIOS) {
    print("is iOS");
    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  late Future<bool> _myinitprivacy;

  @override
  void initState() {
    super.initState();

    _myinitprivacy = _initprivacy();
    print(_myinitprivacy);
    //监听生命周期
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        //应用程序处于闲置状态并且没有收到用户的输入事件。
        //注意这个状态，在切换到后台时候会触发，所以流程应该是先冻结窗口，然后停止UI
        break;
      case AppLifecycleState.paused:
        // 应用程序处于不可见状态
        // String actid = getExtMsg();
        break;
      case AppLifecycleState.resumed:
        //进入应用时不会触发该状态
        //应用程序处于可见状态，并且可以响应用户的输入事件。它相当于 Android 中Activity的onResume。
        Navigator.pushNamed(
            Global.navigatorKey.currentContext!, '/ActivityInfo',
            arguments: {"actid": "actid"});
        break;
      case AppLifecycleState.detached:
        //当前页面即将退出
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("kfkkf"),
        actions: <Widget>[
          // new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   // onPressed: _incrementCounter,

      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  FutureBuilder<bool> _buildFutureBuilder() {
    return FutureBuilder<bool>(
      builder: (context, AsyncSnapshot<bool> async) {
        if (async.connectionState == ConnectionState.active ||
            async.connectionState == ConnectionState.waiting) {
          return SizedBox();
        }
        if (async.connectionState == ConnectionState.done) {
          if (async.hasError) {
            return SizedBox();
          } else if (async.hasData) {
            bool isaggress = async.data;
            return isaggress ? IndexPage() : SplashPage();
          }
        }
      },
      future: _myinitprivacy,
    );
  }

  Future<bool> _initprivacy() async {
    SharedPreferences _isagreeprivacy = await SharedPreferences.getInstance();
    var _isagress = _isagreeprivacy.get("isagreeprivacy");
    if (_isagress != null && _isagress.toString() == "1") {
      return true;
    } else {
      if (Platform.isIOS) {
        return true;
      } else if (Platform.isAndroid) {
        return false;
      }
    }
    return false;
  }
}
