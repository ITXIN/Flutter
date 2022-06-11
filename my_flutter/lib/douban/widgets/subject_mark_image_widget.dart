import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/unit/global_constant.dart';

typedef BoolCallback = void Function(bool isMark);

class SubjectMarkImageWidget extends StatefulWidget {
  SubjectMarkImageWidget({Key? key, this.imgUrl, this.callback})
      : super(key: key);
  final imgUrl;
  final BoolCallback? callback;
  var height;
  var width;

  @override
  _SubjectMarkImageWidgetState createState() =>
      _SubjectMarkImageWidgetState(imgUrl, callback, width, height);
}

class _SubjectMarkImageWidgetState extends State<SubjectMarkImageWidget> {
  final imgUrl;
  final BoolCallback? callback;
  var height;
  var width;

  var markAdded = false;
  var loadImg;
  var markedIcon, unMarkIcon, placeHolderImg;

  @override
  void initState() {
    super.initState();
    placeHolderImg = Image.asset(
        Global.fullLocalImagePath("ic_default_img_subject_movie.9.png"));

    markedIcon = Image(
      image: AssetImage(Global.fullLocalImagePath("ic_subject_mark_added.png")),
      height: height,
      width: width,
    );

    unMarkIcon = Image(
      image: AssetImage(
          Global.fullLocalImagePath("ic_subject_rating_mark_wish.png")),
      height: height,
      width: width,
    );
    loadImg = CachedNetworkImage(
      imageUrl: imgUrl,
      width: width,
      height: height,
      fit: BoxFit.fill,
      placeholder: (BuildContext context, String url) {
        return placeHolderImg;
      },
      fadeInDuration: const Duration(milliseconds: 80),
      fadeOutDuration: const Duration(microseconds: 80),
    );
  }
  // ignore: must_call_super

  _SubjectMarkImageWidgetState(
      this.imgUrl, this.callback, this.width, this.height);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        loadImg,
        GestureDetector(
          child: markAdded ? markedIcon : unMarkIcon,
          onTap: () {
            if (callback != null) {
              callback!(markAdded);
            }
            setState(() {
              markAdded = !markAdded;
            });
          },
        )
      ],
    );
  }
}
