import 'package:flutter/material.dart';

class ProjectInfoTheme extends ThemeExtension<ProjectInfoTheme> {
  const ProjectInfoTheme({
    required this.titleColor,
    required this.shortIntroColor,
    required this.groupNameColor,
    required this.timePlaceColor,
    required this.introColor,
  });

  final Color? titleColor;
  final Color? shortIntroColor;
  final Color? groupNameColor;
  final Color? timePlaceColor;
  final Color? introColor;

  @override
  ProjectInfoTheme copyWith({
    Color? titleColor,
    Color? shortIntroColor,
    Color? groupNameColor,
    Color? timePlaceColor,
    Color? introColor,
  }) {
    return ProjectInfoTheme(
      titleColor: titleColor ?? this.titleColor,
      shortIntroColor: shortIntroColor ?? this.shortIntroColor,
      groupNameColor: groupNameColor ?? this.groupNameColor,
      timePlaceColor: timePlaceColor ?? this.timePlaceColor,
      introColor: introColor ?? this.introColor,
    );
  }

  @override
  ProjectInfoTheme lerp(ProjectInfoTheme? other, double t) {
    if (other is! ProjectInfoTheme) {
      return this;
    }
    return ProjectInfoTheme(
      titleColor: Color.lerp(titleColor, other.titleColor, t),
      shortIntroColor: Color.lerp(shortIntroColor, other.shortIntroColor, t),
      groupNameColor: Color.lerp(groupNameColor, other.groupNameColor, t),
      timePlaceColor: Color.lerp(timePlaceColor, other.timePlaceColor, t),
      introColor: Color.lerp(introColor, other.introColor, t),
    );
  }
}
