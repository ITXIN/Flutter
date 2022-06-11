import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_flutter/tikTok/views/selectText.dart';
// import 'package:my_flutter/views/selectText.dart';

import '../style/style.dart';

enum TikTokPageTag {
  home,
  follow,
  makeVideo,
  msg,
  me,
}

class TikTokTabBar extends StatelessWidget {
  final Function(TikTokPageTag)? onTabSwitch;
  final Function()? onAddButton;

  final bool hasBackground;
  final TikTokPageTag? current;

  const TikTokTabBar(
      {Key? key,
      this.onTabSwitch,
      this.current,
      this.onAddButton,
      this.hasBackground: false})
      : super(key: key);

  // 创建 items
  List<Widget> _itemsCreate() {
    List<Widget> list = <Widget>[];
    List<String> name = ['首页', '关注', '', '消息', '我'];
    List<TikTokPageTag> tag = [
      TikTokPageTag.home,
      TikTokPageTag.follow,
      TikTokPageTag.makeVideo,
      TikTokPageTag.msg,
      TikTokPageTag.me
    ];
    for (var i; i < name.length; i++) {
      var wid;
      if (i != 2) {
        wid = Expanded(
            child: GestureDetector(
          child: SelectText(
            isSelect: current == tag[i],
            title: name[i],
          ),
          onTap: () => onTabSwitch?.call(tag[i]),
        ));
      } else {
        wid = Expanded(
          child: GestureDetector(
            child: Icon(
              Icons.add_box,
              size: 32,
            ),
            onTap: () => onAddButton?.call(),
          ),
        );
      }

      list.add(wid);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.of(context).padding;
    Widget row = Row(
      children: _itemsCreate(),
    );

    return Container(
      color: hasBackground ? ColorPlate.back2 : ColorPlate.back2.withOpacity(0),
      child: Container(
        padding: EdgeInsets.only(bottom: padding.bottom),
        height: 50 + padding.bottom,
        child: row,
      ),
    );
  }
}
