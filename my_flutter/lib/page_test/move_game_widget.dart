import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_flutter/page_test/future_async_await.dart';
import 'package:my_flutter/page_test/painter.dart';

// import '../page/future_async_await.dart';

// import '../page/painter.dart';
// import 'package:my_flutter/page/future_async_await.dart';
// import 'package:my_flutter/page/painter.dart';

/// 博客地址：https://www.jianshu.com/p/6dfc59a955e1
/// https://www.jianshu.com/p/de322d818230

class MyAppMoveGame extends StatelessWidget {
  MyAppMoveGame({required Key key}) : super(key: key);

  final _globalKey = GlobalKey();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(300, 300),
      painter: MyPainter(),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("key demon"),
        ),
        body: Center(
          child: MoveGameWidget(key: _globalKey),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            changeMoveGameStateByGlobalKey();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  changeMoveGameStateByGlobalKey() {
    var state = _globalKey.currentState as MoveGameState;
    state.shuffle();
    state.setState(() => {});

    var request = UserInfoRequest("url");
    request
        .getFriendList("uid")
        .then((value) => {print(value)})
        .catchError((error) => {print(error)});
  }

  testAsyn() async {
    var request = UserInfoRequest("url");
    try {
      var list = await request.getFriendList("uid");
      print(list);
    } catch (error) {
      print("error");
    }
  }

  netRequest() async {
    var httpClient = new HttpClient();
    var url = new Uri.http("authority", "unencodedPath", {"uid": "233"});

    try {
      var request = await httpClient.getUrl(url);
      var resoponse = await request.close();
    } catch (error) {}
  }
}

class MoveGameWidget extends StatefulWidget {
  const MoveGameWidget({required Key key}) : super(key: key);

  // ignore: empty_constructor_bodies
  @override
  State<StatefulWidget> createState() {
    return MoveGameState();
  }
}

class MoveGameState extends State<MoveGameWidget> {
  final boxes = [
    Box2(Colors.blue.shade100, "100", key: UniqueKey()),
    Box2(Colors.blue.shade200, "200", key: UniqueKey()),
    Box2(Colors.blue.shade300, "300", key: UniqueKey()),
    Box2(Colors.blue.shade400, "400", key: UniqueKey()),
    Box2(Colors.blue.shade500, "500", key: UniqueKey()),
    Box2(Colors.blue.shade600, "600", key: UniqueKey()),
  ];

  @override
  void initState() => shuffle();

  shuffle() {
    boxes.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
        children: boxes,
        onReorder: (int olIndex, int newIndex) {
          var tmp = boxes.removeAt(olIndex);
          boxes.insert(newIndex, tmp);
        });
  }
}

class Box2 extends StatelessWidget {
  final Color color;
  final String tag;

  const Box2(this.color, this.tag, {required Key key}) : super(key: key);

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 40,
      height: 50,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      child: Text(
        tag,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 30, color: Colors.deepOrange),
      ),
    );
  }
}
