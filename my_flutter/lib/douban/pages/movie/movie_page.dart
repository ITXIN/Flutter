import 'package:flutter/material.dart';
import 'package:my_flutter/douban/pages/movie/icon_title_widget.dart';
import 'package:my_flutter/douban/widgets/loading_widget.dart';
import 'dart:math' as math;

import 'package:my_flutter/douban/widgets/subject_mark_image_widget.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
//测试下拉刷新
    // return _testRefresh(list, (data) {
    //   setState(() {
    //     list.add(data);
    //     print("object$list");
    //   });
    // });

    return Container(
      child: SubjectMarkImageWidget(
        imgUrl:
            "https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif",
      ),
      //     child: Container(
      //   child: LoadingWidget.getLoading(
      //     bgColor: Colors.red,
      //   ),
      // )
      // TitleIconWidget(),
    );
  }
}

Widget containerBody() {
  return Padding(
    padding: EdgeInsets.only(left: 15.0, right: 15.0),
    child: CustomScrollView(
      physics: const BouncingScrollPhysics(),
    ),
  );
}

List<String> list = ['199', '111'];
typedef RequestCallBack = void Function(String data);
Widget _testRefresh(List<String> list, RequestCallBack callBack) {
  return Scaffold(
    body: RefreshIndicator(
      displacement: 10,
      onRefresh: () async {
        if (callBack != null) {
          String i = (math.Random().nextInt(220)).toString();
          callBack(i);
        }
      },
      child: Container(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${list[index]}'),
          );
        },
        itemCount: list.length,
        itemExtent: 50,
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
      )),
    ),
  );
}
