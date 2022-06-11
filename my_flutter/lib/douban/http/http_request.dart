import 'dart:io';
import 'dart:convert' as Convert;
import 'package:http/http.dart' as http;

typedef RequestCallBack = void Function(Map data);

class HttpRequest {
  requestGET(String authority, String unencodedPath, RequestCallBack callBack,
      [Map<String, String>? queryParameters]) async {
    try {
      var httpClient = new HttpClient();
      var url = new Uri.http(authority, unencodedPath, queryParameters);
      var request = await httpClient.getUrl(url);
      var response = await request.close();
      var responseBody = await response.transform(Convert.utf8.decoder).join();
      Map data = Convert.jsonDecode(responseBody);
      callBack(data);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  final baseUrl;
  HttpRequest(this.baseUrl);

  Future<dynamic> get(String uri, {Map<String, String>? headers}) async {
    try {
      http.Response response = await http.get(baseUrl + uri, headers: headers);
      final statusCode = response.statusCode;
      final body = response.body;
      var result = Convert.jsonDecode(body);
      return result;
    } catch (e) {
      print('[uri=$uri]exception e=${e.toString()}');
    }
  }

  Future<dynamic> getResponseBody(String uri,
      {Map<String, String>? headers}) async {
    try {
      http.Response response = await http.get(baseUrl + uri, headers: headers);
      final statusCode = response.statusCode;
      final body = response.body;
//      var result = Convert.jsonDecode(body);
      print('[uri=$uri][statusCode=$statusCode][response=$body]');
      return body;
    } on Exception catch (e) {
      print('[uri=$uri]exception e=${e.toString()}');
      return null;
    }
  }

  Future<dynamic> post(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      http.Response response =
          await http.post(baseUrl + uri, body: body, headers: headers);
      final statusCode = response.statusCode;
      final responseBody = response.body;
      var result = Convert.jsonDecode(responseBody);
      print('[uri=$uri][statusCode=$statusCode][response=$responseBody]');
      return result;
    } on Exception catch (e) {
      print('[uri=$uri]exception e=${e.toString()}');
      return '';
    }
  }
}
