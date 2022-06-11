///书影音
///包含了'电影', '电视', '综艺', '读书', '音乐', '同城' item Widget
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_flutter/douban/pages/movie/movie_page.dart';
import 'package:my_flutter/douban/widgets/search_text_field_widget.dart';

var _tabController;
var titleList = ['电影', '电视', '综艺', '读书', '音乐', '同城'];
late List<Widget> tabList;

///这个Widget是整个项目中，十分复杂的Widget之一
class BookAudioVideoPage extends StatefulWidget {
  const BookAudioVideoPage({Key? key}) : super(key: key);

  @override
  _BookAudioVideoPageState createState() => _BookAudioVideoPageState();
}

class _BookAudioVideoPageState extends State<BookAudioVideoPage>
    with SingleTickerProviderStateMixin {
  var tabBar;

  @override
  void initState() {
    super.initState();
    tabBar = MovieTabBar();
    tabList = getTabList();
    _tabController = TabController(length: tabList.length, vsync: this);
  }

  List<Widget> getTabList() {
    return titleList
        .map((e) => Text(
              "$e",
              style: TextStyle(fontSize: 15),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: DefaultTabController(
        length: titleList.length,
        child: _getNestedScrollView(tabBar),
      )),
    );
  }
}

Widget _getNestedScrollView(Widget tabBar) {
  String hintText = "20220519";
  return NestedScrollView(
      headerSliverBuilder: ((context, innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10.0),
              child: SearchTextFieldWidget(
                hintText: hintText,
                onTab: () {},
              ),
            ),
          ),
          SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: _SliverAppBarDelegate(
                  maxHeight: 49.0,
                  minHeight: 49.0,
                  child: Container(
                    child: tabBar,
                    color: Colors.purple,
                  )))
        ];
      }),
      body: FlutterTabBarView(
        tabController: _tabController,
      ));
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => max((maxHeight), minExtent);

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class MovieTabBar extends StatefulWidget {
  const MovieTabBar({Key? key}) : super(key: key);

  @override
  _MovieTabBarState createState() => _MovieTabBarState();
}

class _MovieTabBarState extends State<MovieTabBar> {
  late Color selectColor, unselectedColor;
  late TextStyle selectStyle, unselectedStyle;

  @override
  void initState() {
    super.initState();
    selectColor = Colors.black;
    unselectedColor = Color.fromARGB(255, 117, 117, 117);
    selectStyle = TextStyle(fontSize: 18, color: selectColor);
    unselectedStyle = TextStyle(fontSize: 18, color: unselectedColor);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: TabBar(
          /*
           Tab小部件列表
   List<Widget>  @required this.tabs,
    组件选中以及动画的状态
  TabController this.controller,
    Tab是否可滑动(false->整个tab会把宽度填满，true-> tab包裹)
 bool  this.isScrollable = false,
    选项卡下方的导航条的颜色
  Color this.indicatorColor,
    选项卡下方的导航条的线条粗细
  double this.indicatorWeight = 2.0,
 EdgeInsetsGeometry  this.indicatorPadding = EdgeInsets.zero,
  Decoration this.indicator,
  TabBarIndicatorSize this.indicatorSize,导航条的长度，（tab：默认等分；label：跟标签长度一致）
 Color  this.labelColor,所选标签标签的颜色
 TextStyle  this.labelStyle,所选标签标签的文本样式
 EdgeInsetsGeometry  this.labelPadding,,所选标签标签的内边距
Color   this.unselectedLabelColor,未选定标签标签的颜色
 TextStyle  this.unselectedLabelStyle,未选中标签标签的文字样式
  void Function(T value) this.onTap,按下时的响应事件
          */
          tabs: tabList,
          isScrollable: true,
          controller: _tabController,
          indicatorColor: selectColor,
          labelColor: selectColor,
          labelStyle: selectStyle,
          unselectedLabelColor: unselectedColor,
          unselectedLabelStyle: unselectedStyle,
          indicatorSize: TabBarIndicatorSize.label,
        ));
  }
}

class FlutterTabBarView extends StatelessWidget {
  final TabController tabController;

  FlutterTabBarView({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build FlutterTabBarView');
    var viewList = [
      // MoviePage(key: PageStorageKey<String>('MoviePage'),),
      MoviePage(),
      Page2(),
      // DouBanListView(key: PageStorageKey<String>('DouBanListView'),),
      Page2(),
      Page4(),
      Page5(),
      Page1(),
    ];
    return TabBarView(
      children: viewList,
      controller: tabController,
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build Page1');

    return Center(
      child: Text('Page1'),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build Page2');
    return Center(
      child: Text('Page2'),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build Page3');
    return Center(
      child: Text('Page3'),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build Page4');
    return Center(
      child: Text('Page4'),
    );
  }
}

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build Page5');
    return Center(
      child: Text('Page5'),
    );
  }
}
