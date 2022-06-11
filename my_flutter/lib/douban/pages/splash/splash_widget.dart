import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_flutter/douban/pages/container_page.dart';
import 'package:my_flutter/unit/global_constant.dart';

// App 首页
class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  var container = ContainerPage();
  bool showAd = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Offstage(
          child: container,
          offstage: showAd,
        ),
        Offstage(
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: Global.screenWidth / 3,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage(Global.fullLocalImagePath("home.png")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          '落花有意随流水,流水无心恋落花',
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment(1.0, 0.0),
                        child: Container(
                          margin: const EdgeInsets.only(right: 30.0, top: 20),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10.0, top: 2.0, bottom: 2.0),
                          child: CountDownWidget(
                            onCountDownFinishCallBack: (bool value) {
                              if (value) {
                                setState(() {
                                  showAd = false;
                                });
                              }
                            },
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xffEDEDED),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Global.fullLocalImagePath("ic_launcher.png"),
                              width: 50,
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Hi, XXX',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            width: Global.screenWidth,
            height: Global.screenHeight,
          ),
          offstage: !showAd,
        )
      ],
    );
  }
}

class CountDownWidget extends StatefulWidget {
  final onCountDownFinishCallBack;
  const CountDownWidget({Key? key, this.onCountDownFinishCallBack})
      : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  var _second = 6;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTime();
  }

  void _startTime() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_second <= 1) {
          widget.onCountDownFinishCallBack(true);
          _cancelTimer();
          return;
        }
      });
      _second--;
    });
  }

  void _cancelTimer() {
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_second',
      style: TextStyle(fontSize: 17.0),
    );
  }
}
