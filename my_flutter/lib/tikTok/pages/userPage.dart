import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_flutter/tikTok/style/style.dart';
// import 'package:my_flutter/mock/video.dart';
// import 'package:my_flutter/style/style.dart';
// import 'package:my_flutter/views/topToolRow.dart';
import 'package:tapped/tapped.dart';

class UserPage extends StatefulWidget {
  final bool canPop;
  final bool isSelfPage;
  final Function? onPop;
  final Function? onSwitch;

  const UserPage(
      {Key? key,
      this.canPop: false,
      required this.isSelfPage,
      this.onPop,
      this.onSwitch})
      : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Container(
      margin: EdgeInsets.fromLTRB(18, 0, 0, 12),
      alignment: Alignment.bottomLeft,
      height: 74,
      width: 74,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(74 / 2),
          color: Color.fromARGB(255, 148, 109, 106),
          border: Border.all(color: Colors.white, width: 1)),
      child: ClipOval(
          child: Image.network(
        "https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif",
        fit: BoxFit.fill,
        height: 74,
        width: 74,
        alignment: Alignment.center,
      )),
    );

    Widget body = ListView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: <Widget>[
        Container(
          //顶部空白
          height: 62,
          // color: Colors.purple,
        ),
        Stack(
          //头像与钱包
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              height: 62,
              color: ColorPlate.back1,
            ),
            avatar,
            Positioned(
              bottom: 12,
              right: 18,
              child: _UserRightButton(
                title: widget.isSelfPage ? '钱包' : '关注',
              ),
            )
          ],
        ),
        Container(
          //用户名相关信息
          color: ColorPlate.back1,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 12),
                // margin: EdgeInsets.symmetric(vertical: 30),
                color: ColorPlate.back1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '@用户名',
                      style: StandardTextStyle.big,
                    ),
                    Container(height: 8),
                    Text(
                      '朴实无华，且枯燥',
                      style: StandardTextStyle.smallWithOpacity.apply(
                        color: Colors.white,
                      ),
                    ),
                    Container(height: 10),
                    Row(
                      children: <Widget>[
                        _UserTag(tag: '幽默'),
                        _UserTag(tag: '机智'),
                        _UserTag(tag: '枯燥'),
                        _UserTag(tag: '狮子座'),
                      ],
                    ),
                    Container(height: 10),
                  ],
                ),
              ),
              Container(
                //关注，粉丝，获赞
                color: ColorPlate.back1,
                // height: 30,
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _TextGroup('356', '关注'),
                    _TextGroup('145万', '粉丝'),
                    _TextGroup('1423万', '获赞'),
                  ],
                ),
              ),
              Container(
                // 线
                height: 10,
                margin: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                //分栏标题样式
                color: ColorPlate.back1,
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _PointSelectTextButton(true, "作品"),
                    _PointSelectTextButton(false, "关注"),
                    _PointSelectTextButton(false, "喜欢"),
                  ],
                ),
              ),
              UserVideoTable(), //作品
            ],
          ),
        ),
      ],
    );

    Widget header = Positioned(
      right: 10,
      top: 15,
      child: Tapped(
        child: Container(
          width: 30,
          height: 30,
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.36),
              borderRadius: BorderRadius.circular(15)),
          alignment: Alignment.center,
          child: Icon(
            Icons.more_horiz,
            size: 24,
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => UserPage(isSelfPage: true)));
        },
      ),
    );

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: <Color>[Colors.orange, Colors.red])),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          body,
          header,
        ],
      ),
    );
  }
}

//按钮
class _UserRightButton extends StatelessWidget {
  const _UserRightButton({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 20,
      ),
      margin: EdgeInsets.all(0),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(color: ColorPlate.orange),
      ),
      // color: ColorPlate.back1,
      decoration: BoxDecoration(
        border: Border.all(color: ColorPlate.orange),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

///标签
class _UserTag extends StatelessWidget {
  final String? tag;
  const _UserTag({Key? key, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      decoration: BoxDecoration(
        // 修饰器，decoration中的color不可与Container的color属性同时设置，设置了decoration后，Container的color必须去掉
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4), topRight: Radius.circular(4)),
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //       color: Colors.red,
        //       offset: Offset(4, 4),
        //       blurRadius: 4,
        //       spreadRadius: 5)
        // ],
        // gradient: LinearGradient(colors: [Colors.black, Colors.purple])),
        // borderRadius: BorderRadius.circular(4)
      ),
      child: Text(
        tag ?? "标签",
        style: StandardTextStyle.smallWithOpacity,
      ),
    );
  }
}

// 关注 ，粉丝，获赞
class _TextGroup extends StatelessWidget {
  final String title, tag;
  final Color? color;
  const _TextGroup(this.title, this.tag, {Key? key, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: StandardTextStyle.big.apply(color: color),
          ),
          Container(
            width: 4,
          ),
          Text(
            tag,
            style: StandardTextStyle.smallWithOpacity
                .apply(color: color?.withOpacity(0.6)),
          )
        ],
      ),
    );
  }
}

class UserVideoTable extends StatefulWidget {
  const UserVideoTable({Key? key}) : super(key: key);

  @override
  _UserVideoTableState createState() => _UserVideoTableState();
}

//列表
class _UserVideoTableState extends State<UserVideoTable> {
  List _waterFallList = [];

  @override
  void initState() {
    super.initState();
    var randomNum = new Random();

    for (var i = 0; i < 40; i++) {
      _waterFallList.add(50 + 150 * randomNum.nextDouble());
    }
  }

  Widget itemVideo(double item) {
    return Container(
      child: Center(child: Text(item.toStringAsFixed(0))),
      height: item,
      decoration: BoxDecoration(
          color: ColorPlate.back1,
          border: Border.all(color: ColorPlate.orange),
          borderRadius: BorderRadius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(2),
        color: ColorPlate.white.withOpacity(0.6),
        child: MasonryGridView.count(
          crossAxisCount: 3,
          itemBuilder: (BuildContext context, int index) =>
              itemVideo(_waterFallList[index]),
          itemCount: _waterFallList.length,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          physics:
              const NeverScrollableScrollPhysics(), //本身不滚动让外边的signelscrollview滚动
          shrinkWrap: true, //收缩，让元素宽度自适应
        ),
      ),
    );
  }
}

// 分栏标题样式
class _PointSelectTextButton extends StatelessWidget {
  final bool isSelect;
  final String title;
  final Function? onTap;
  const _PointSelectTextButton(this.isSelect, this.title,
      {Key? key, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSelect
              ? Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                      color: ColorPlate.orange,
                      borderRadius: BorderRadius.circular(3)),
                )
              : Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                      color: ColorPlate.gray,
                      borderRadius: BorderRadius.circular(3)),
                ),
          Container(
            padding: EdgeInsets.only(left: 2),
            child: Text(
              title,
              style: isSelect
                  ? StandardTextStyle.small
                  : StandardTextStyle.smallWithOpacity,
            ),
          )
        ],
      ),
    );
  }
}
