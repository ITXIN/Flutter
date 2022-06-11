import 'package:flutter/material.dart';

class TabBarItem extends StatefulWidget {
  final TabController _tabController;
  final List<Widget> tabs;
  const TabBarItem(this._tabController, this.tabs, {Key? key})
      : super(key: key);
  @override
  _TabBarItemState createState() => _TabBarItemState();
}

class _TabBarItemState extends State<TabBarItem> {
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
    widget._tabController.dispose();
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
          tabs: widget.tabs,
          isScrollable: true,
          controller: widget._tabController,
          indicatorColor: selectColor,
          labelColor: selectColor,
          labelStyle: selectStyle,
          unselectedLabelColor: unselectedColor,
          unselectedLabelStyle: unselectedStyle,
          indicatorSize: TabBarIndicatorSize.label,
        ));
  }
}
