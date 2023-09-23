import 'package:flutter/material.dart';

import 'package:yagamy/constant/theme/notification_theme.dart';
import 'package:yagamy/constant/theme/projects_body_theme.dart';
import 'package:yagamy/constant/theme/search_button_theme.dart';
import 'package:yagamy/constant/theme/project_card_theme.dart';
import 'package:yagamy/constant/theme/shimmer_theme.dart';
import 'package:yagamy/constant/theme/project_info_theme.dart';

class AppTheme {
  static final ThemeData defalutAppTheme = ThemeData(
    splashFactory: NoSplash.splashFactory,
    colorScheme: const ColorScheme.light(
      primary: Color.fromRGBO(255, 139, 68, 1.0),
      secondary: Color.fromRGBO(255, 205, 66, 1.0),
      tertiary: Color.fromRGBO(255, 92, 70, 1.0),
      outline: Color.fromRGBO(224, 224, 224, 1),
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 1.0,
      iconTheme: IconThemeData(color: Colors.black, size: 30),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    cardTheme: const CardTheme(color: Colors.white),
    dividerTheme: const DividerThemeData(
      color: Color.fromRGBO(140, 140, 140, 1.0),
      thickness: 2.0,
    ),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      dividerColor: Colors.transparent,
      labelColor: Colors.black,
      labelPadding: EdgeInsets.only(left: 30, right: 30),
      labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      unselectedLabelStyle:
          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
    ),
    outlinedButtonTheme: const OutlinedButtonThemeData(
      style: ButtonStyle(splashFactory: NoSplash.splashFactory),
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
      ProjectInfoTheme(
        titleColor: Colors.black,
        shortIntroColor: Color.fromRGBO(97, 97, 97, 1.0),
        groupNameColor: Color.fromRGBO(97, 97, 97, 1.0),
        timePlaceColor: Colors.black,
        introColor: Colors.black,
      ),
      ShimmerTheme(
        shimmerGradient: LinearGradient(
          colors: [Color(0xFFEBEBF4), Color(0xFFF4F4F4), Color(0xFFEBEBF4)],
          stops: [0.1, 0.3, 0.4],
          begin: Alignment(-1.0, -0.3),
          end: Alignment(1.0, 0.3),
          tileMode: TileMode.clamp,
        ),
      ),
      ProjectsBodyTheme(
        backgroundBaseColor: Color.fromRGBO(255, 255, 255, 0.25),
        gradientStartColor: Colors.transparent,
        gradientEndColor: Color.fromRGBO(255, 255, 255, 1.0),
      ),
      NotificationCardTheme(
        titleColor: Colors.black,
        bodyColor: Colors.grey,
        borderColor: Colors.grey,
      ),
    ],
  );
}
