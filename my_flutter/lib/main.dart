import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<bool> _showDialog() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text("确定要操作吗？"),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text("删除"),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  Future<T> showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(
          builder: builder,
        );
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(
                    data: theme,
                    child: pageChild,
                  )
                : pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.red,
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: child,
    );
  }

  Future<bool> _showCusDialog() {
    return showCustomDialog<bool>(
        context: context,
        builder: (context) {
          //  return _showCupertinoAlertDialog();
          return _showAlertDialog();
        });
  }

  Widget _showAlertDialog() {
    return AlertDialog(
        title: Center(
            child: Text(
          '标题',
          style: TextStyle(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        )),
        titleTextStyle: TextStyle(color: Colors.red, fontSize: 25),
        content: Text("您确定要删除当前文件吗?"),
        actions: _actions());
  }

  List<Widget> _actions() {
    var actions = 1;
    if (actions == 1) {
      return <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 10, 0),
        ),
        FlatButton(
          // padding: EdgeInsets.fromLTRB(10, 0, 150, 0),
          child: Text("确定"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 80, 0),
        ),
      ];
    } else {
      return <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 10, 0),
        ),
        FlatButton(
          child: Text("取消"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: Text("删除"),
          onPressed: () {
            // 执行删除操作
            Navigator.of(context).pop(true);
          },
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 40, 0),
        ),
      ];
    }
  }

  Widget _showCupertinoAlertDialog() {
    return CupertinoAlertDialog(
      title: Text("data"),
      content: new SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text("IOS风格"),
            Text("是否要删除？"),
            Text("一旦删除数据不可恢复!")
          ],
        ),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text("确定"),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        CupertinoDialogAction(
          child: Text("取消"),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        onPressed: () async {
          bool delete = await _showCusDialog();
          if (delete == null) {
            print("取消删除");
          } else {
            print("已确认删除");
          }
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
