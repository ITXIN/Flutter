import 'package:flutter/material.dart';
import 'package:my_flutter/unit/global_constant.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTab;

  final String hintText;
  final EdgeInsetsGeometry? margin;

  const SearchTextFieldWidget(
      {Key? key,
      this.onSubmitted,
      this.onTab,
      required this.hintText,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin == null ? EdgeInsets.all(0.0) : margin,
      width: Global.screenWidth,
      alignment: AlignmentDirectional.center,
      height: 37.0,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 236, 237),
          borderRadius: BorderRadius.circular(24.0)),
      child: TextField(
        onSubmitted: onSubmitted,
        onTap: onTab,
        cursorColor: Color.fromARGB(255, 0, 189, 96),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 8.0),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 17, color: Color.fromARGB(255, 192, 191, 191)),
            prefixIcon: Icon(
              Icons.search,
              size: 25,
              color: Color.fromARGB(255, 128, 128, 128),
            )),
        style: TextStyle(fontSize: 17.0),
      ),
    );
  }
}
