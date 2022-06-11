import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget {
  static Widget getLoading(
      {Color? bgColor = Colors.transparent,
      Color? loadingBgColor = Colors.white}) {
    return Container(
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: bgColor,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: loadingBgColor == null ? Colors.white : loadingBgColor,
            borderRadius: BorderRadius.circular(10.0)),
        width: 70.0,
        height: 70.0,
        alignment: AlignmentDirectional.center,
        /*
        .SizedBox介绍
一个特定大小的盒子。这个widget给予子控件宽度和高度。如果宽度或高度为null，则此widget将调整自身大小以匹配子控件的大小。

2.SizedBox属性
width：宽
height： 高
child：
SizedBox尺寸调节：
SizedBox没有宽高约束，子控件有宽高约束，那么SizedBox会调节自己匹配子控件大小
SizedBox有宽高约束，SizedBox子控件没有宽高约束，SizedBox父控件无约束，那么SizedBox会将自己的约束条件给予SizedBox子控件
SizedBox父控件有约束，那么约束会传递给SizedBox

作者：starryxp
链接：https://www.jianshu.com/p/e92a844f406a
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
        
        */
        child: SizedBox(
          height: 25.0,
          width: 25.0,
          /*
          CupertinoActivityIndicator 是一个顺时针旋转的 iOS 风格的活动指示器，不能对其设置进度，只能一直转转转(除非你设置 animating = false)

其构造函数比较简单，只有两个属性

const CupertinoActivityIndicator({
    Key key,
    this.animating = true, // 是否正在运行活动指示器动画，默认为 true，设置 false 停止动画，animating 属性不能为空
    this.radius = _kDefaultIndicatorRadius, // 活动指示器的半径，默认为 10px。radius 属性不能为空，且必须大于0。
})
————————————————
版权声明：本文为CSDN博主「Allen Su」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_42351033/article/details/107398156
          */
          child: CupertinoActivityIndicator(
            radius: 15.0,
          ),
        ),
      ),
    );
  }

  static Widget containerLoadingBody(Widget body,
      {bool loading = true, Color? bgColor, Color? loadingBgColor}) {
    return Stack(
      children: [
        body,
        Offstage(
          child: getLoading(bgColor: bgColor, loadingBgColor: loadingBgColor),
          offstage: !loading,
        )
      ],
    );
  }
}
