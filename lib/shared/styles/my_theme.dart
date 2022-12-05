// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/shared/styles/colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: appbarcolor,
    scaffoldBackgroundColor: lightbackground,
    colorScheme: ColorScheme(
      primary: appbarcolor,
      onPrimary: white,
      secondary: black,
      onSecondary: withoutcolor,
      error: withoutcolor,
      onError: withoutcolor,
      surface: withoutcolor,
      onSurface: withoutcolor,
      background: lightbackground,
      onBackground: withoutcolor,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: appbarcolor,
      iconTheme: IconThemeData(color: white),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      subtitle1: TextStyle(fontSize: 20, color: appbarcolor),
      subtitle2: TextStyle(fontSize: 20, color: donecolor),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: appbarcolor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: white,
      selectedItemColor: appbarcolor,
      unselectedItemColor: Colors.grey.shade400,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: appbarcolor,
    scaffoldBackgroundColor: lightbackground,
    colorScheme: ColorScheme(
      primary: appbarcolor,
      onPrimary: black,
      secondary: white,
      onSecondary: withoutcolor,
      error: withoutcolor,
      onError: withoutcolor,
      surface: withoutcolor,
      onSurface: withoutcolor,
      background: darkbackground,
      onBackground: withoutcolor,
      brightness: Brightness.dark,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: black)),
    textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        subtitle1: TextStyle(fontSize: 20, color: Colors.yellow)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkbackground,
        selectedItemColor: white,
        unselectedItemColor: Colors.white),
  );
  
}
