import 'package:flutter/material.dart';

import 'package:yagamy/constant/theme/search_button_theme.dart';
import 'package:yagamy/constant/theme/execute_button_theme.dart';
import 'package:yagamy/constant/theme/project_card_theme.dart';
import 'package:yagamy/constant/theme/slide_button_theme.dart';

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
      cardTheme: const CardTheme(color: Colors.white),
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
      extensions: const <ThemeExtension<dynamic>>[
        SearchButtonTheme(
          unSelectedColor: Color.fromRGBO(238, 238, 238, 1.0),
          unSelectedTextColor: Color.fromRGBO(66, 66, 66, 1.0),
          selectedColor: Color.fromRGBO(66, 66, 66, 1.0),
          selectedTextColor: Colors.white,
        ),
        ProjectCardTheme(
          color: Colors.white,
          textColor: Colors.black,
          groupDisplayColor: Color.fromRGBO(97, 97, 97, 1.0),
        ),
        SlideButtonTheme(
          backgroundColor: Color.fromRGBO(238, 238, 238, 1.0),
          sliderColor: Colors.white,
          textColor: Colors.black,
        ),
        ExecuteButtonTheme(
          backgroundGradient: <Color>[
            Color(0xff47d5e6),
            Color(0xff01d0f1),
            Color(0xff00cafc),
            Color(0xff00c3ff),
            Color(0xff00bbff),
            Color(0xff00b2ff),
            Color(0xff3aa7ff),
            Color(0xff6b9aff),
            Color(0xff918bff),
            Color(0xffb279ff),
            Color(0xffce63ee),
            Color(0xffe647d6),
          ],
          textColor: Colors.white,
        )
      ]);
}
