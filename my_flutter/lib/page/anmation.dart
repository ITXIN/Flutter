import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AnimationTest1 extends StatefulWidget {
  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<AnimationTest1>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  // Animation _animation;
  Color _color;
  double _size = 100;
  @override
  void initState() {
    super.initState();
    _color = Colors.greenAccent;
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
        lowerBound: 100,
        upperBound: 200)
      ..addListener(() {
        setState(() {
          _size = _controller.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    // _animation = Tween(begin: 1.0, end: 0.01)
    // .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    // _animation有不同的构建方式
    // _animation = Tween(begin: 1.0, end: 0.2)
    //     .chain(CurveTween(curve: Curves.easeIn))
    //     .animate(_controller);
    // _animation = _controller
    //     .drive(Tween(begin: 1.0, end: 0.1))
    //     .drive(CurveTween(curve: Curves.linearToEaseOut));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _controller.forward(),
      child: Opacity(
        opacity: 1.0,
        child: Container(
          width: _size,
          height: _size,
          color: _color,
          child: Center(child: Text("Demo1")),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

class Demo3 extends StatefulWidget {
  @override
  _Demo3State createState() => _Demo3State();
}

class _Demo3State extends State<Demo3> with SingleTickerProviderStateMixin {
  double _size = 100;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
        lowerBound: 100,
        upperBound: 200)
      ..addListener(() {
        setState(() {
          _size = _controller.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _controller.forward();
      },
      child: Container(
        width: _size,
        height: _size,
        color: Colors.redAccent,
        child: Center(
          child: Text("Demo3"),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ColorTweenDemo extends StatefulWidget {
  @override
  _ColorTweenDemoState createState() => _ColorTweenDemoState();
}

class _ColorTweenDemoState extends State<ColorTweenDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _animation;

  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addListener(() {
            setState(() {});
          });
    _animation =
        ColorTween(begin: Colors.red, end: Colors.green).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _controller.forward();
      },
      child: Container(
        height: 100,
        width: 100,
        color: _animation.value,
      ),
    );
  }
}

class Demo5 extends StatefulWidget {
  @override
  _Demo5State createState() => _Demo5State();
}

class _Demo5State extends State<Demo5> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<EdgeInsets> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller.forward();
            }
          });
    _animation = _controller.drive(EdgeInsetsTween(
        begin: EdgeInsets.fromLTRB(50, 50, 0, 0),
        end: EdgeInsets.only(top: 200, left: 200)));
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      _controller.forward();
    });
    return EdgeInsetsDemo(
      animation: _animation,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class EdgeInsetsDemo extends AnimatedWidget {
  EdgeInsetsDemo({Key key, Animation<EdgeInsets> animation})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<EdgeInsets> animation = listenable;
    return Container(
      margin: animation.value,
      width: 100,
      height: 100,
      color: Colors.red,
    );
  }
}

class Demo8 extends StatefulWidget {
  @override
  _Demo8State createState() => _Demo8State();
}

class _Demo8State extends State<Demo8> with SingleTickerProviderStateMixin {
  bool _animation = false;

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      children: <Widget>[
        setIcon(AnimatedIcons.play_pause),
        setIcon(AnimatedIcons.add_event),
        setIcon(AnimatedIcons.arrow_menu),
        setIcon(AnimatedIcons.close_menu),
        setIcon(AnimatedIcons.ellipsis_search),
        setIcon(AnimatedIcons.event_add),
        setIcon(AnimatedIcons.home_menu),
        setIcon(AnimatedIcons.list_view),
        InkWell(onTap: () => _controller.forward())
      ],
    );
  }

  Widget setIcon(AnimatedIconData iconData) {
    return Center(
      child: AnimatedIcon(
        size: 30,
        icon: iconData,
        progress: _controller,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Demo10 extends StatefulWidget {
  @override
  _Demo10State createState() => _Demo10State();
}

// 图片显示，
class _Demo10State extends State<Demo10> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      itemCount: 15,
      itemBuilder: (BuildContext content, int index) {
        return Container(
          child: InkWell(
            child: Hero(
              tag: "images/Img01.webp" + "$index", // 唯一的标记，前后两个路由的Hero的tag必须相同
              child: Image.asset(
                "images/Img01.webp",
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 250),
                  pageBuilder: (BuildContext context, Animation animation,
                      Animation secondAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: HeroAnimationRoute(
                          "images/Img01.webp", "images/Img01.webp" + "$index"),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
    );
  }
}

class HeroAnimationRoute extends StatelessWidget {
  final String imageName, tag;
  HeroAnimationRoute(this.imageName, this.tag);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Center(
          child: Hero(
            tag: tag,
            child: Image.asset(
              imageName,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
