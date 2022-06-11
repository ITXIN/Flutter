class UserInfoRequest {
  String url;
  UserInfoRequest(this.url);

  Future<List<String>> getFriendList(String uid) {
    return new Future<List<String>>(() {
      return ["1", "2"];
    });
  }
}
