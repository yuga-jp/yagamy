import 'package:flutter/material.dart';

class ExecuteButtonTheme extends ThemeExtension<ExecuteButtonTheme> {
  const ExecuteButtonTheme({
    required this.backgroundGradient,
    required this.textColor,
  });

  final List<Color>? backgroundGradient;
  final Color? textColor;

  @override
  ExecuteButtonTheme copyWith({
    List<Color>? backgroundGradient,
    Color? textColor,
  }) {
    return ExecuteButtonTheme(
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ExecuteButtonTheme lerp(ExecuteButtonTheme? other, double t) {
    if (other is! ExecuteButtonTheme) {
      return this;
    }
    return ExecuteButtonTheme(
      backgroundGradient: null,
      textColor: Color.lerp(textColor, other.textColor, t),
    );
  }
}
