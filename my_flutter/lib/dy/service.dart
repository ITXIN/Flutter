import 'dart:ffi';

import 'package:flutter/material.dart';

abstract class DYdialog {
  static void alert(
    context, {
    required String text,
    String title = '提示',
    String yes = '确定',
    Function? yesCallBack,
  }) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: [Text(text)],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (yesCallBack != null) {
                      yesCallBack();
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text(yes))
            ],
          );
        }).then((value) {});
  }
}
