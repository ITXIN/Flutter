// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// class Dialog extends StatefulWidget {
//   @override
//   // State<StatefulWidget> createState() {
//   //   // TODO: implement createState
//   //   new DialogState();
//   // }
//   @override
//   State<StatefulWidget> createState() {
//     return new DialogState();
//   }
//   // State<DialogState> createState() => DialogState();
// }

// class DialogState extends State<Dialog> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("widget"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               'dd',
//               style: Theme.of(context).textTheme.bodyText1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         // onPressed: _incrementCounter,
//         onPressed: () async {
//           bool delete = await _showCusDialog();
//           if (delete == null) {
//             print("取消删除");
//           } else {
//             print("已确认删除");
//           }
//         },
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }

//   Future<bool> _showDialog() {
//     return showDialog<bool>(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("提示"),
//             content: Text("确定要操作吗？"),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text("取消"),
//                 onPressed: () => Navigator.of(context).pop(),
//               ),
//               FlatButton(
//                 child: Text("删除"),
//                 onPressed: () {
//                   Navigator.of(context).pop(true);
//                 },
//               ),
//             ],
//           );
//         });
//   }

//   Future<T> showCustomDialog<T>({
//     required BuildContext context,
//     bool barrierDismissible = true,
//     required WidgetBuilder builder,
//   }) {
//     // final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
//     final ThemeData theme = Theme.of(context);
//     return showGeneralDialog(
//       context: context,
//       pageBuilder: (BuildContext buildContext, Animation<double> animation,
//           Animation<double> secondaryAnimation) {
//         final Widget pageChild = Builder(
//           builder: builder,
//         );
//         return SafeArea(
//           child: Builder(builder: (BuildContext context) {
//             return theme != null
//                 ? Theme(
//                     data: theme,
//                     child: pageChild,
//                   )
//                 : pageChild;
//           }),
//         );
//       },
//       barrierDismissible: barrierDismissible,
//       barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
//       barrierColor: Colors.red,
//       transitionDuration: const Duration(milliseconds: 150),
//       transitionBuilder: _buildMaterialDialogTransitions,
//     );
//   }

//   Widget _buildMaterialDialogTransitions(
//       BuildContext context,
//       Animation<double> animation,
//       Animation<double> secondaryAnimation,
//       Widget child) {
//     return ScaleTransition(
//       scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
//       child: child,
//     );
//   }

//   Future<bool> _showCusDialog() {
//     return showCustomDialog<bool>(
//         context: context,
//         builder: (context) {
//           //  return _showCupertinoAlertDialog();
//           return _showAlertDialog();
//         });
//   }

//   Widget _showAlertDialog() {
//     return AlertDialog(
//         title: Center(
//             child: Text(
//           '标题',
//           style: TextStyle(
//               color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
//         )),
//         titleTextStyle: TextStyle(color: Colors.red, fontSize: 25),
//         content: Container(
//             child: Text(
//           '你热量零食打发了时间都浪费了多少分浪费的时间浪费多少分类舒服了对双方来说分类,你热量零食打发了时间都浪费了多少分浪费的时间浪费多少分类舒服了对双方来说分类',
//           style: TextStyle(
//               color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
//         )),
//         actions: _actions());
//   }

//   List<Widget> _actions() {
//     // return <Widget>[
//     //   // Expanded(
//     //   //   flex: 5,
//     //   //   child: new Row(
//     //   //     children: <Widget>[
//     // Expanded(
//     //   flex: 1,
//     //     child: new Container(
//     //   alignment: Alignment.center,
//     //   color: Colors.black38,
//     //   child: new Text("這裡是logo"),
//     // )),
//     //         Expanded(
//     //           flex: 1,
//     //             child: new Container(
//     //           alignment: Alignment.center,
//     //           color: Colors.black38,
//     //           child: new Text("這裡是logo"),
//     //         ))
//     //     //   ],
//     //     // ))
//     // ];

//     var actions = 1;
//     if (actions == 1) {
//       return <Widget>[
//         // Container(
//         //   child: Expanded(
//         //     child: Expanded(
//         //       flex: 1,
//         //         child: new Container(
//         //       alignment: Alignment.center,
//         //       color: Colors.black38,
//         //       child: new Text("這裡是logo"),
//         //     )),
//         //   )
//         // )

//         // Row(
//         //   mainAxisAlignment: MainAxisAlignment.center,
//         //   children: <Widget>[
//         //     OutlineButton(
//         //       child: Text("button1"),
//         //       onPressed: () {},
//         //       splashColor: Colors.grey[100],
//         //       borderSide: BorderSide(color: Colors.black),
//         //     ),
//         //     OutlineButton(
//         //       child: Text("button2"),
//         //       onPressed: () {},
//         //       splashColor: Colors.grey[100],
//         //       borderSide: BorderSide(color: Colors.black),
//         //     ),
//         //   ],
//         // )
//         Padding(
//           padding: EdgeInsets.fromLTRB(40, 0, 10, 0),
//         ),
//         OutlineButton(
//           child: Text("button"),
//           onPressed: () {},
//           splashColor: Colors.grey[100],
//           borderSide: BorderSide(color: Colors.black),
//         ),
//         FlatButton(
//           // padding: EdgeInsets.fromLTRB(10, 0, 150, 0),
//           child: Text("确定"),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(10, 0, 80, 0),
//         ),
//       ];
//     } else {
//       return <Widget>[
//         Padding(
//           padding: EdgeInsets.fromLTRB(40, 0, 10, 0),
//         ),
//         FlatButton(
//           child: Text("取消"),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         FlatButton(
//           child: Text("删除"),
//           onPressed: () {
//             // 执行删除操作
//             Navigator.of(context).pop(true);
//           },
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(10, 0, 40, 0),
//         ),
//       ];
//     }
//   }

//   Widget _showCupertinoAlertDialog() {
//     return CupertinoAlertDialog(
//       title: Text("提示"),
//       content: new SingleChildScrollView(
//         child: ListBody(
//           children: <Widget>[
//             Text("IOS风格"),
//             Text("是否要删除？"),
//             Text("一旦删除数据不可恢复!")
//           ],
//         ),
//       ),
//       actions: <Widget>[
//         CupertinoDialogAction(
//           child: Text("确定"),
//           onPressed: () {
//             Navigator.of(context).pop(true);
//           },
//         ),
//         CupertinoDialogAction(
//           child: Text("取消"),
//           onPressed: () {
//             Navigator.of(context).pop(true);
//           },
//         ),
//       ],
//     );
//   }
// }
