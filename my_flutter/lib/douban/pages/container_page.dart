import 'package:flutter/material.dart';
import 'package:my_flutter/douban/pages/home/home_page.dart';
import 'package:my_flutter/douban/pages/movie/book_audio_video_page.dart';
import 'package:my_flutter/douban/pages/shop_page.dart';
import 'package:my_flutter/unit/global_constant.dart';

import 'person/person_center_page.dart';

//作为整个App最外层的容器，以Tab为基础控制每个item的显示与隐藏
class ContainerPage extends StatefulWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  ShopPageWidget shopPageWidget = ShopPageWidget();

  final defaultItemColor = Color.fromARGB(255, 125, 125, 125);
  List<_Item> itemNames = [
    _Item("首页", Global.fullLocalImagePath("ic_tab_home_active.png"),
        Global.fullLocalImagePath("ic_tab_home_normal.png")),
    _Item("书影音", Global.fullLocalImagePath("ic_tab_subject_active.png"),
        Global.fullLocalImagePath("ic_tab_subject_normal.png")),
    _Item("小组", Global.fullLocalImagePath("ic_tab_group_active.png"),
        Global.fullLocalImagePath("ic_tab_group_normal.png")),
    _Item("市集", Global.fullLocalImagePath("ic_tab_shiji_active.png"),
        Global.fullLocalImagePath("ic_tab_shiji_normal.png")),
    _Item("我的", Global.fullLocalImagePath("ic_tab_profile_active.png"),
        Global.fullLocalImagePath("ic_tab_profile_normal.png")),
  ];
  late List<Widget> pages;
  late List<BottomNavigationBarItem> itemList;

  int _selectIndex = 0;

  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _selectIndex != index,
      child: TickerMode(enabled: _selectIndex == index, child: pages[index]),
    );
  }

  @override
  void didUpdateWidget(covariant ContainerPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void initState() {
    super.initState();
    pages = [
      HomePage(),
      BookAudioVideoPage(),
      HomePage(),
      shopPageWidget,
      PersonCenterPage(),
    ];

    itemList = itemNames
        .map((item) => BottomNavigationBarItem(
            icon: Image.asset(
              item.normalIcon,
              width: 30.0,
              height: 30.0,
            ),
            label: item.name,
            activeIcon: Image.asset(
              item.activeIcon,
              width: 30.0,
              height: 30.0,
            )))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetList() {
      List<Widget> list = [];
      for (var i = 0; i < itemList.length; i++) {
        list.add(_getPagesWidget(i));
      }
      return list;
    }

    return Scaffold(
      body: new Stack(
        children: _widgetList(),
      ),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index) {
          setState(() {
            _selectIndex = index;
            shopPageWidget
                .setShowState(pages.indexOf(shopPageWidget) == _selectIndex);
          });
        },
        iconSize: 24.0,
        currentIndex: _selectIndex,
        //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
        fixedColor: Color.fromARGB(255, 0, 188, 96),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class _Item {
  String name, activeIcon, normalIcon;
  _Item(this.name, this.activeIcon, this.normalIcon);
}
