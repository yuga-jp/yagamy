import 'package:flutter/material.dart';

class SearchButtonTheme extends ThemeExtension<SearchButtonTheme> {
  const SearchButtonTheme({
    required this.unSelectedColor,
    required this.unSelectedTextColor,
    required this.selectedColor,
    required this.selectedTextColor,
  });

  final Color? unSelectedColor;
  final Color? unSelectedTextColor;
  final Color? selectedColor;
  final Color? selectedTextColor;

  @override
  SearchButtonTheme copyWith({
    Color? unSelectedColor,
    Color? unSelectedTextColor,
    Color? selectedColor,
    Color? selectedTextColor,
  }) {
    return SearchButtonTheme(
      unSelectedColor: unSelectedColor ?? this.unSelectedColor,
      unSelectedTextColor: unSelectedTextColor ?? this.unSelectedTextColor,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedTextColor: selectedTextColor ?? this.selectedTextColor,
    );
  }

  @override
  SearchButtonTheme lerp(SearchButtonTheme? other, double t) {
    if (other is! SearchButtonTheme) {
      return this;
    }
    return SearchButtonTheme(
      unSelectedColor: Color.lerp(unSelectedColor, other.unSelectedColor, t),
      unSelectedTextColor:
          Color.lerp(unSelectedTextColor, other.unSelectedTextColor, t),
      selectedColor: Color.lerp(selectedColor, other.selectedColor, t),
      selectedTextColor:
          Color.lerp(selectedTextColor, other.selectedTextColor, t),
    );
  }
}
