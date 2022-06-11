import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/douban/bean/subject_entity.dart';
import 'package:my_flutter/douban/http/mock_request.dart';
import 'package:my_flutter/douban/pages/person/my_book_video_music.dart';
import 'package:my_flutter/douban/widgets/image/heart_img_widget.dart';
import 'package:my_flutter/unit/global_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonCenterPage extends StatefulWidget {
  const PersonCenterPage({Key? key}) : super(key: key);

  @override
  _PersonCenterPageState createState() => _PersonCenterPageState();
}

class _PersonCenterPageState extends State<PersonCenterPage> {
  late List<Subject> list;
  void requestAPI() async {
    var _request = MockRequest();
    // 本地文件都需要在pubspec.yaml 进行设置
    var result = await _request.mock2('top250'); //top250 celebrity
    var resultList = result['subjects'];
    list = resultList.map<Subject>((item) => Subject.fromMap(item)).toList();
    print("list ========:$list");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    requestAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 0.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: false,
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                // flexibleSpace: HeartImgWidget(Image.asset(
                //     Global.fullLocalImagePath(
                //         "bg_person_center_default.webp"))),
                flexibleSpace: Container(
                  child: Image.asset(Global.fullLocalImagePath(
                      "bg_person_center_default.webp")),
                ),
                expandedHeight: 200,
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10.0, top: 15.0, bottom: 20.0, right: 10.0),
                      child: Image.asset(
                        Global.fullLocalImagePath('ic_notify.png'),
                        width: 30.0,
                        height: 30.0,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '提醒',
                        style: TextStyle(fontSize: 17.0),
                      ),
                    ),
                    // _rightArrow()
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 100.0,
                  alignment: Alignment.center,
                  child: Text(
                    '暂无新提醒',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              _divider(),
              SliverToBoxAdapter(
                child: Container(child: VideoBookMusicBookWidget()),
              ),
              _divider(),
              SliverToBoxAdapter(
                child: Container(child: VideoBookMusicBookWidget()),
              ),
              _divider(),
              SliverToBoxAdapter(
                child: Container(child: VideoBookMusicBookWidget()),
              ),
              _divider(),
              SliverToBoxAdapter(
                child: Container(child: VideoBookMusicBookWidget()),
              ),
              _divider(),
              UseNetDataWidget()
            ],
          ),
        ),
      ),
    );
  }
}

SliverToBoxAdapter _divider() {
  return SliverToBoxAdapter(
    child: Container(
      height: 10.0,
      color: const Color.fromARGB(255, 247, 247, 247),
    ),
  );
}

class UseNetDataWidget extends StatefulWidget {
  const UseNetDataWidget({Key? key}) : super(key: key);

  @override
  _UseNetDataWidgetState createState() => _UseNetDataWidgetState();
}

class _UseNetDataWidgetState extends State<UseNetDataWidget> {
  bool mSelectNetData = false;
  String txt = "开----书影音数据是否来自网络";

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      mSelectNetData = prefs.getBool(Global.usNetData) ?? false;
    });
  }

  _setData(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(Global.usNetData, value);

    setState(() {
      if (value) {
        txt = "开----书影音数据是否来自网络";
      } else {
        txt = "关----书影音数据是否来自网络";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Row(
          children: [
            Text(
              txt,
              style: TextStyle(color: Colors.redAccent, fontSize: 17.0),
            ),
            Expanded(child: Container()),
            CupertinoSwitch(
                value: mSelectNetData,
                onChanged: (bool value) {
                  mSelectNetData = value;
                  _setData(value);
                  var temp;
                  if (value) {
                    temp = "kdkkfdkskf";
                  } else {
                    temp = "kdkkfdkskf";
                  }
                  setState(() {});
                })
          ],
        ),
      ),
    );
  }
}
