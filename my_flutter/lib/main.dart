import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:my_flutter/list.dart';
import 'package:my_flutter/page/anmation.dart';
import 'package:my_flutter/page/move_game_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 10;
  bool _value = false;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

// 跳转其他页面
  Future<void> _pushSaved1() async {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("My page"),
          ),
          body: new RandomWords(),
        );
      },
    ));
  }

  Future<void> _pushSaved() async {
    _counter = await Navigator.push(context, MaterialPageRoute<int>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("push test"),
          ),
          body: GestureDetector(
            child: Demo10(),
            // Text(
            //   'pushed view',
            // ),
            onTap: () {
              Navigator.pop(context, 100);
            },
          ),
        );
      },
    ));

    setState(() {
      // _counter++;
      // _value = !_value;
      print(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:$_value',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        // onPressed: () {
        //   Navigator.push(
        //       context,
        //       PageRouteBuilder(
        //           transitionDuration: Duration(milliseconds: 500),
        //           pageBuilder: (BuildContext context, Animation animation,
        //               Animation secondAnimation) {
        //             return FadeTransition(
        //                 opacity: animation, child: RandomWords());
        //           }));
        // },
        // onPressed: () async {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
