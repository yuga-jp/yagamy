import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData defalutAppTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: const Color.fromRGBO(71, 213, 230, 1.0),
      outline: Colors.grey.shade300,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.5,
      iconTheme: IconThemeData(color: Colors.black, size: 30),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.black,
      space: 30,
      thickness: 0.5,
    ),
    tabBarTheme: const TabBarTheme(
      dividerColor: Colors.transparent,
      labelColor: Colors.black,
      labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      unselectedLabelStyle:
          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
    ),
  );
}
