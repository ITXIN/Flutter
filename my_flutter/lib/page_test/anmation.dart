import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MyAnimation extends StatelessWidget {
  MyAnimation({required Key key}) : super(key: key);

  final _globalKey = GlobalKey();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("key demon"),
        ),
        body: Center(
          child: MyAnimationWidget(key: _globalKey),
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
    // AnimationController ct = AnimationController(
    //   vsync: this,
    //   duration: Duration(seconds: 3),
    //   lowerBound: 10,
    //   upperBound: 20,
    // );

    // final CurvedAnimation cure =
    //     CurvedAnimation(parent: ct, curve: Curves.easeIn);
  }
}

class MyAnimationWidget extends StatefulWidget {
  const MyAnimationWidget({required Key key}) : super(key: key);

  // ignore: empty_constructor_bodies
  @override
  State<StatefulWidget> createState() {
    return MyAnimationWidgetState();
  }
}

class MyAnimationWidgetState extends State<MyAnimationWidget> {
  @override
  void initState() => shuffle();

  shuffle() {}

  @override
  Widget build(BuildContext context) {
    return Text("OK");
  }
}

class ShakeCure extends Curve {
  @override
  double transform(double t) {
    return sin(t * pi * 2);
  }
}

abstract class TickerProvider {
  Ticker createticker(TickerCallback onTick);
}
