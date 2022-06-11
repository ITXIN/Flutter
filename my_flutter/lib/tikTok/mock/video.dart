import 'dart:io';

Socket? socket;

var videoList = [];

class UserVideo {
  final String url;
  final String image;
  final String? desc;

  UserVideo({
    required this.url,
    required this.image,
    this.desc,
  });

  static List<UserVideo> fetchVideo() {
    List<UserVideo> list = videoList
        .map((e) => UserVideo(
            url: 'https://static.ybhospital.net/$e',
            image: '',
            desc: 'test_video_desc'))
        .toList();
    return list;
  }

  @override
  String toString() {
    return 'image:$image' '\nvideo:$url';
  }
}
