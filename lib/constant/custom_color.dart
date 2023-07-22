import 'package:flutter/material.dart';

class CustomColor {
  static const Color unSelectedSearchButtonColor =
      Color.fromRGBO(238, 238, 238, 1.0);
  static const Color textColorOnUnSelectedSearchButton =
      Color.fromRGBO(66, 66, 66, 1.0);
  static const Color selectedSearchButtonColor =
      Color.fromRGBO(66, 66, 66, 1.0);
  static const Color textColorOnSelectedSearchButton = Colors.white;

  static const groupDisplayColor = Color.fromRGBO(97, 97, 97, 1.0);

  static const Color slideButtonBackgroundColor =
      Color.fromRGBO(238, 238, 238, 1.0);
  static const Color slideButtonSliderColor = Colors.white;

  static List<Color> executeButtonGradient = const <Color>[
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
  ];
  static const Color textColorOnExecuteButton = Colors.white;
}
