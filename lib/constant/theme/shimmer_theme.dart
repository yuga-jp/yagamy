import 'package:flutter/material.dart';

class ShimmerTheme extends ThemeExtension<ShimmerTheme> {
  const ShimmerTheme({required this.shimmerGradient});

  final LinearGradient? shimmerGradient;

  @override
  ShimmerTheme copyWith({LinearGradient? shimmerGradient}) {
    return ShimmerTheme(
        shimmerGradient: shimmerGradient ?? this.shimmerGradient);
  }

  @override
  ShimmerTheme lerp(ShimmerTheme? other, double t) {
    if (other is! ShimmerTheme) {
      return this;
    }
    return ShimmerTheme(shimmerGradient: shimmerGradient);
  }
}
