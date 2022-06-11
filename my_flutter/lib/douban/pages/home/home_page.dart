// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/douban/http/http_request.dart';
import 'package:my_flutter/unit/global_constant.dart';
import 'dart:math' as math;
import '../../bean/subject_entity.dart';
import '../../http/API.dart';
import '../../widgets/search_text_field_widget.dart';

///首页，TAB页面，显示动态和推荐TAB
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _testCustomScrollView();
    return Container(
      color: Colors.red,
      child: Center(
        child: getWidget(),
      ),
    );
  }
}

var _tabs = ['动态', '推荐'];
DefaultTabController getWidget() {
  return DefaultTabController(
    initialIndex: 1,
    length: _tabs.length,
    child: NestedScrollView(
      // headerSliverBuilder	折叠头部
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
              context,
            ),
            sliver: SliverAppBar(
              //当此值为true时 SliverAppBar 会固定在页面顶部
              //当此值为fase时 SliverAppBar 会随着滑动向上滑动
              pinned: true,
              //展开区域的高度
              expandedHeight: 120,
              //此应用栏是否显示在屏幕顶部
              primary: true,
              //横轴上标题内容 周围的间距
              titleSpacing: 0.0,
              /*
              this.backgroundColor,//APP bar 的颜色，默认值为 ThemeData.primaryColor。改值通常和下面的三个属性一起使用
              this.brightness,   //App bar 的亮度，有白色和黑色两种主题，默认值为 ThemeData.primaryColorBrightness
              this.iconTheme,  //App bar 上图标的颜色、透明度、和尺寸信息。默认值为 ThemeData().primaryIconTheme
              this.textTheme,   //App bar 上的文字主题。默认值为 ThemeData（）.primaryTextTheme
              */
              backgroundColor: Colors.white,
              /*
              一个显示在 AppBar 下方的控件，高度和 AppBar 高度一样，可以实现一些特殊的效果，该属性通常在 SliverAppBar 中使用
              */

              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  color: Colors.green,
                  child: SearchTextFieldWidget(
                    onSubmitted: (fun) {
                      print("object$fun");
                    },
                    hintText: '影视作品坎坎坷坷',
                    margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                    onTab: () {},
                  ),
                  alignment: Alignment(0.0, 0.0),
                ),
              ),
              //一个 AppBarBottomWidget 对象，通常是 TabBar。用来在 Toolbar 标题下面显示一个 Tab 导航栏
              bottom: TabBar(
                tabs: _tabs
                    .map((String name) => Container(
                          child: Text(name),
                          color: Colors.purple,
                          padding: const EdgeInsets.only(bottom: 5.0),
                        ))
                    .toList(),
              ),
            ),
          )
        ];
      },
      // 滚动组件实体
      body: TabBarView(
        children: _tabs.map((String name) {
          return SliverContainer(name: name);
        }).toList(),
      ),
    ),
  );
}

class SliverContainer extends StatefulWidget {
  final String name;
  const SliverContainer({Key? key, required this.name}) : super(key: key);

  @override
  _SliverContainerState createState() => _SliverContainerState();
}

class _SliverContainerState extends State<SliverContainer> {
  late List<Subject> list;
  @override
  void initState() {
    super.initState();

    // if (list == null || list.isEmpty) {
    // 请求动态数据
    if (_tabs[0] == widget.name) {
    } else {
      // 请求推荐数据

      // }
    }
  }

  void requestAPI() async {
    var _request = HttpRequest(API.BASE_URL);
    int start = math.Random().nextInt(220);
    final Map result =
        await _request.get(API.TOP_250 + '?start=$start&count=30');
    var resultList = result['subjects'];
    list = resultList.map<Subject>((item) => Subject.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _testCustomScrollView();
    if (_tabs[0] == widget.name) {
      return _loginContainer(context);
    } else {
      return SafeArea(
          top: false,
          bottom: false,
          child: Builder(builder: (BuildContext context) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              key: PageStorageKey<String>(widget.name),
              slivers: [
                /*
                需要注意的是在使用NestScrollView包裹CustomScrollView时，直接使用会出现滑动的时候SliverAppBar遮挡CustomScrollView的列表内容，可以使用
SliverOverlapAbsorber（它的作用就是获取 SliverAppBar 返回时遮住内部可滚动组件的部分的长度，这个长度就是 overlap（重叠） 的长度）将SliverAppBar包裹一下，
同时，给CustomScrollview的列表包裹一个 SliverOverlapInjector（它会将 SliverOverlapAbsorber 中获取的overlap 长度应用到内部可滚动组件中）。
SliverOverlapAbsorber和SliverOverlapInjector都需要传入一个handle，
具体指：NestedScrollView.sliverOverlapAbsorberHandleFor(context)。这样便是标准的解决方案。
                
                */
                SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context)),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                  return Container(
                    child: Text("Item Test"),
                  );
                }, childCount: list.length))
              ],
            );
          }));
    }
  }
}

///动态TAB
_loginContainer(BuildContext context) {
  return Align(
    alignment: Alignment(0.0, 0.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          Global.fullLocalImagePath('ic_new_empty_view_default.png'),
          width: 120.0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 25.0),
          child: Text(
            '登录后查看关注人动态',
            style: TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
        ),
        GestureDetector(
          child: Container(
            child: Text(
              '去登录',
              style: TextStyle(fontSize: 16.0, color: Colors.green),
            ),
            padding: const EdgeInsets.only(
                left: 35.0, right: 35.0, top: 8.0, bottom: 8.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: const BorderRadius.all(Radius.circular(6.0))),
          ),
          onTap: () {
            // MyRouter.push(context, MyRouter.searchPage, '搜索笨啦灯');
          },
        )
      ],
    ),
  );
}

_testCustomScrollView() {
  return NestedScrollView(
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return [
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverAppBar(
            floating: true,
            snap: true,
            expandedHeight: 200,
            forceElevated: innerBoxIsScrolled,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.purple,
              ),
            ),
          ),
        ),
      ];
    },
    body: Builder(
      builder: (BuildContext context) {
        return CustomScrollView(
          slivers: [
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                          "https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif"),
                      backgroundColor: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    ),
  );

  return NestedScrollView(
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return [
        SliverAppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          collapsedHeight: 0,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset("images/bird.jpg", fit: BoxFit.cover),
          ),
        ),
      ];
    },
    body: ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 80,
          color: Colors.primaries[index % Colors.primaries.length],
          alignment: Alignment.center,
          child: Text(
            "$index",
            style: TextStyle(color: Colors.white),
          ),
        );
      },
      itemCount: 30,
    ),
  );
// ————————————————
// 版权声明：本文为CSDN博主「xiangxiongfly915」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
// 原文链接：https://blog.csdn.net/qq_14876133/article/details/121373212

  return CustomScrollView(
    slivers: [
      SliverPersistentHeader(
        pinned: true,
        delegate: MySliverPersistentHeaderDelegate(),
      ),
      SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              color: Colors.primaries[index % Colors.primaries.length],
            );
          },
        ),
      ),
    ],
  );
// ————————————————
// 版权声明：本文为CSDN博主「xiangxiongfly915」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
// 原文链接：https://blog.csdn.net/qq_14876133/article/details/121373212;

  return CustomScrollView(
    slivers: [
      SliverAppBar(
        pinned: true,
        expandedHeight: 200,
        flexibleSpace: FlexibleSpaceBar(
          title: const Text("sliverAppBar"),
          background: Container(
            height: 200,
            color: Colors.purple,
          ),
        ),
      ),
      SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              height: 50,
              color: Colors.primaries[index % Colors.primaries.length],
              child: Text('$index'),
            );
          }),
          itemExtent: 50.0)
    ],
  );

  return CustomScrollView(
    slivers: [
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            height: 50,
            color: Colors.primaries[index % Colors.primaries.length],
          );
        },
        childCount: 5,
      )),
      SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }, childCount: 20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5))
    ],
  );
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        "hello world",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
// ————————————————
// 版权声明：本文为CSDN博主「xiangxiongfly915」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
// 原文链接：https://blog.csdn.net/qq_14876133/article/details/121373212