import 'package:flutter/material.dart';
import 'package:my_flutter/tikTok/pages/userPage.dart';
import 'package:my_flutter/tikTok/style/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tiktok',
      theme: ThemeData(
        brightness: Brightness.dark,
        hintColor: Colors.white,
        accentColor: Colors.white,
        primaryColor: ColorPlate.orange,
        primaryColorBrightness: Brightness.dark,
        scaffoldBackgroundColor: ColorPlate.back1,
        dialogBackgroundColor: ColorPlate.back2,
        accentColorBrightness: Brightness.light,
        textTheme: TextTheme(
          bodyText1: StandardTextStyle.normal,
        ),
      ),
      // home: UserPage(
      //   isSelfPage: true,
      // ),
      home: Material(
          child: UserPage(
        isSelfPage: true,
      )),
    );
  }
}
