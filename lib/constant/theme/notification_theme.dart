import 'package:flutter/material.dart';

class NotificationCardTheme extends ThemeExtension<NotificationCardTheme> {
  const NotificationCardTheme({
    required this.titleColor,
    required this.bodyColor,
    required this.borderColor,
  });

  final Color? titleColor;
  final Color? bodyColor;
  final Color? borderColor;

  @override
  NotificationCardTheme copyWith({
    Color? titleColor,
    Color? bodyColor,
    Color? borderColor,
  }) {
    return NotificationCardTheme(
      titleColor: titleColor ?? this.titleColor,
      bodyColor: bodyColor ?? this.bodyColor,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  @override
  NotificationCardTheme lerp(NotificationCardTheme? other, double t) {
    if (other is! NotificationCardTheme) {
      return this;
    }
    return NotificationCardTheme(
      titleColor: Color.lerp(titleColor, other.titleColor, t),
      bodyColor: Color.lerp(bodyColor, other.bodyColor, t),
      borderColor: Color.lerp(borderColor, other.borderColor, t),
    );
  }
}
