import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class MockRequest {
  Future<dynamic> get(String action, {Map? params}) async {
    return mock(action: getJsonName(action), params: params);
  }

  Future<dynamic> post(String action, {Map? params}) async {
    return mock(action: getJsonName(action), params: params);
  }

  Future<dynamic> mock({required String action, Map? params}) async {
    var responseStr = await rootBundle.loadString('mock/$action.json');
    var responseJson = json.decode(responseStr);
    return responseJson;
  }

  Future<dynamic> mock2(String action) async {
    // WidgetsFlutterBinding.ensureInitialized(); //解决加载json错误
    var responseStr = await rootBundle.loadString('mock/$action.json');
    var responseJson = json.decode(responseStr);
    return responseJson;
  }

  Map<String, String> map = {
    'in_theaters': 'in_theaters',
    'coming_soon': 'coming_soon',
    'top250': 'top250',
    'weekly': 'weekly',
    'reviews': 'reviews',
  };
  getJsonName(String action) {
    return map[action];
  }
}
