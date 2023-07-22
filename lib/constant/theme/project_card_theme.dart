import 'package:flutter/material.dart';

class ProjectCardTheme extends ThemeExtension<ProjectCardTheme> {
  const ProjectCardTheme({
    required this.color,
    required this.textColor,
    required this.groupDisplayColor,
  });

  final Color? color;
  final Color? textColor;
  final Color? groupDisplayColor;

  @override
  ProjectCardTheme copyWith({
    Color? color,
    Color? textColor,
    Color? groupDisplayColor,
  }) {
    return ProjectCardTheme(
      color: color ?? this.color,
      textColor: textColor ?? this.textColor,
      groupDisplayColor: groupDisplayColor ?? this.groupDisplayColor,
    );
  }

  @override
  ProjectCardTheme lerp(ProjectCardTheme? other, double t) {
    if (other is! ProjectCardTheme) {
      return this;
    }
    return ProjectCardTheme(
      color: Color.lerp(color, other.color, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      groupDisplayColor:
          Color.lerp(groupDisplayColor, other.groupDisplayColor, t),
    );
  }
}
