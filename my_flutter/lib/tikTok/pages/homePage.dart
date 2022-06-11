import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:my_flutter/controller/tikTokVideoListController.dart';
// import 'package:my_flutter/views/tikTokScaffold.dart';
// import 'package:my_flutter/views/tiktokTabBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  get key => null;

  // TikTokPageTag tabBarType = TikTokPageTag.home;
  // TikTokScaffoldController tkController = TikTokScaffoldController();
  // PageController _pageController = PageController();
  // TikTokVideoListController _videoListController = TikTokVideoListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            // BoostNavigator.instance.pop();
          },
        ),
        middle: const Text('FlutterBoost Example MainPage'),
      ),
      // bottomNavigationBar: _buildBottomBar(),
      body: Container(
        width: 300,
        height: 300,
        child: Text("11Test TikTok"),
      ),
    );
  }
}
