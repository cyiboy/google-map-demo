import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
      ),
      leading: new IconButton(
        icon: new Icon(
          Icons.arrow_back,
          color: Colors.black45,
        ),
        onPressed: () {
          print('object');
          Navigator.pop(context);
        },
      ),

      elevation: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
