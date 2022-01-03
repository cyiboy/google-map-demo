
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "OpenSans",

    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 21.6,
      letterSpacing: 1,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: true,
    color: Colors.transparent,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(
          // color: Color(0XFF8B8B8B),
          color: Colors.black,
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
          fontSize: 21.6),
    ),
  );
}


