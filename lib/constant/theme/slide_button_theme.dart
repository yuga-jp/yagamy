import 'package:flutter/material.dart';

class SlideButtonTheme extends ThemeExtension<SlideButtonTheme> {
  const SlideButtonTheme({
    required this.backgroundColor,
    required this.sliderColor,
    required this.textColor,
  });

  final Color? backgroundColor;
  final Color? sliderColor;
  final Color? textColor;

  @override
  SlideButtonTheme copyWith({
    Color? backgroundColor,
    Color? sliderColor,
    Color? textColor,
  }) {
    return SlideButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      sliderColor: sliderColor ?? this.sliderColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  SlideButtonTheme lerp(SlideButtonTheme? other, double t) {
    if (other is! SlideButtonTheme) {
      return this;
    }
    return SlideButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      sliderColor: Color.lerp(sliderColor, other.sliderColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
    );
  }
}
