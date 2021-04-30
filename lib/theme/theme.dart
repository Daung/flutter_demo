import 'package:flutter/material.dart';

class WZAppTheme {
  static const double _normalFontSize = 12;
  static const double _middleFontSize = 14;
  static const double _largeFontSize = 18;
  static final ThemeData themeData = ThemeData(
      //primarySwatch传递的是MaterialColor ，我们使用的的color.red[100]
      //是因为MaterialColor重写了[]操作符
      primarySwatch: Colors.blue,
      primaryColor: Colors.green,
      accentColor: Colors.purple,
      //默认scaffold的背景颜色
      canvasColor: Colors.white,
      highlightColor: Colors.transparent,
      textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: _normalFontSize, color: Colors.black),
          bodyText2: TextStyle(fontSize: _largeFontSize, color: Colors.red)),
      buttonTheme: ButtonThemeData(
          minWidth: 30, height: 150, buttonColor: Colors.orange));

  static final ThemeData darkThemeData = ThemeData(
      //primarySwatch传递的是MaterialColor ，我们使用的的color.red[100]
      //是因为MaterialColor重写了[]操作符
      primarySwatch: Colors.green,
      primaryColor: Colors.green,
      accentColor: Colors.purple,
      //默认scaffold的背景颜色
      canvasColor: Colors.grey,
      textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: _normalFontSize, color: Colors.green),
          bodyText2: TextStyle(fontSize: _largeFontSize, color: Colors.red)),
      buttonTheme: ButtonThemeData(
          minWidth: 30, height: 150, buttonColor: Colors.orange));
}
