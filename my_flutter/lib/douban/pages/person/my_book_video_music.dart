import 'package:flutter/material.dart';
import 'package:my_flutter/douban/widgets/tabBart_item_widget.dart';
import 'package:my_flutter/unit/global_constant.dart';

late TabController _tabController;
final List<String> tabTxt = ['影视', '图书', '音乐'];

//'影视', '图书', '音乐
class VideoBookMusicBookWidget extends StatefulWidget {
  const VideoBookMusicBookWidget({Key? key}) : super(key: key);

  @override
  _VideoBookMusicBookWidgetState createState() =>
      _VideoBookMusicBookWidgetState();
}

//---实现 SingleTickerProviderStateMixin
class _VideoBookMusicBookWidgetState extends State<VideoBookMusicBookWidget>
    with SingleTickerProviderStateMixin {
  late final List<Widget> tabWidgets;
  @override
  void initState() {
    super.initState();
    //---初始化TabController
    _tabController = TabController(length: tabTxt.length, vsync: this);
    //---监听
    _tabController.addListener(() {
      print('selecte indx:${_tabController.index}');
    });
    tabWidgets = tabTxt
        .map((item) => Text(
              item,
              style: TextStyle(fontSize: 15),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: DefaultTabController(
        length: tabTxt.length,
        child: Column(children: [
          Align(
            child: TabBarItem(
                _tabController, tabWidgets), //---需要在TabBar设置controller
            alignment: Alignment.centerLeft,
          ),
          _tabView()
        ]),
      ),
    );
  }

  Widget _tabView() {
    return Expanded(
        child: TabBarView(
      children: [
        _tabBarItem('bg_videos_stack_default.png'),
        _tabBarItem('bg_books_stack_default.png'),
        _tabBarItem('bg_music_stack_default.png'),
      ],
      //---需要在TabBarView 设置controller
      controller: _tabController,
    ));
  }

  Widget _getTabViewItem(String imgName, String txt) {
    return Column(children: [
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 7.0),
          child: Image.asset(
            Global.fullLocalImagePath(imgName),
            fit: BoxFit.contain,
          ),
        ),
      ),
      Text(txt)
    ]);
  }

  _tabBarItem(String imgName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _getTabViewItem(imgName, '想看1'),
        _getTabViewItem(imgName, '想看2'),
        _getTabViewItem(imgName, '想看3'),
        _getTabViewItem(imgName, '想看4')
      ],
    );
  }
}
