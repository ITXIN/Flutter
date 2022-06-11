import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:my_flutter/unit/global_constant.dart';

bool _closed = false;
bool _isShow = true;
String url1 = 'https://flutterchina.club/';
final _webviewReference = FlutterWebviewPlugin();

class ShopPageWidget extends StatelessWidget {
  const ShopPageWidget({Key? key}) : super(key: key);

  void setShowState(bool isShow) {
    _isShow = isShow;
    if (!isShow) {
      _closed = true;
      _webviewReference.hide();
      _webviewReference.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
// 导航栏是H5页面的，这里需要留出刘海的高度
      appBar: PreferredSize(
          child: Container(
            color: Colors.white,
          ),
          preferredSize: Size.fromHeight(0)),
      url: url1,
      initialChild: Container(
        color: Colors.green,
        child: Center(
          child: Text(
            '加载中...',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class WebViewPageWidget extends StatefulWidget {
  const WebViewPageWidget({Key? key}) : super(key: key);

  @override
  _WebViewPageWidgetState createState() => _WebViewPageWidgetState();
}

class _WebViewPageWidgetState extends State<WebViewPageWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _webviewReference.close();
    _webviewReference.onUrlChanged.listen((event) {
      if (url1 != url1) {
        print('new url $url1');
      }
    });
    _webviewReference.launch(url1,
        withJavascript: true,
        withLocalStorage: true,
        scrollBar: true,
        rect: Rect.fromLTRB(0.0, 0.0, Global.screenWidth, Global.screenHeight));
  }

  @override
  void dispose() {
    super.dispose();
    _webviewReference.close();
    _webviewReference.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
