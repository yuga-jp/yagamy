import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData defalutAppTheme = ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSwatch(
        cardColor: Colors.white,
      ).copyWith(
          primary: const Color(0xFF47D5E6), outline: Colors.grey.shade300),
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
      dividerTheme: const DividerThemeData(
          color: Colors.black, space: 30, thickness: 0.5));
}
