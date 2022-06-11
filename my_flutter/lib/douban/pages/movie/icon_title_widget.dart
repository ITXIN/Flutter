import 'package:flutter/material.dart';
import 'package:my_flutter/unit/global_constant.dart';

typedef TapCallback = void Function(int index);

class TitleIconWidget extends StatelessWidget {
  const TitleIconWidget({Key? key}) : super(key: key);

  List<Widget> _itemList() {
    List<Widget> items = [];
    List<String> titles = ['电影', '榜单', '豆瓣菜', '豆瓣片单'];
    List<String> iconNames = [
      'find_movie.png',
      'douban_top.png',
      'douban_guess.png',
      'douban_film_list.png',
    ];

    for (var i = 0; i < titles.length; i++) {
      var ges = GestureDetector(
        onTap: () {
          print("TitleIconWidget index:$i");
        },
        child: Column(
          children: [
            Image.asset(
              Global.fullLocalImagePath(iconNames[i]),
              height: 45,
              width: 45,
            ),
            Text(
              titles[i],
              style: TextStyle(
                  fontSize: 13, color: Color.fromARGB(255, 128, 128, 128)),
            )
          ],
        ),
      );
      items.add(ges);
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _itemList(),
    );
  }
}
