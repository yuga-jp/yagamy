import 'package:flutter/material.dart';

class ProjectsPlaceBodyTheme extends ThemeExtension<ProjectsPlaceBodyTheme> {
  const ProjectsPlaceBodyTheme({
    required this.backgroundBaseColor,
    required this.gradientStartColor,
    required this.gradientEndColor,
  });

  final Color? backgroundBaseColor;
  final Color? gradientStartColor;
  final Color? gradientEndColor;

  @override
  ProjectsPlaceBodyTheme copyWith({
    Color? backgroundBaseColor,
    Color? gradientStartColor,
    Color? gradientEndColor,
  }) {
    return ProjectsPlaceBodyTheme(
      backgroundBaseColor: backgroundBaseColor ?? this.backgroundBaseColor,
      gradientStartColor: gradientStartColor ?? this.gradientStartColor,
      gradientEndColor: gradientEndColor ?? this.gradientEndColor,
    );
  }

  @override
  ProjectsPlaceBodyTheme lerp(ProjectsPlaceBodyTheme? other, double t) {
    if (other is! ProjectsPlaceBodyTheme) {
      return this;
    }
    return ProjectsPlaceBodyTheme(
      backgroundBaseColor:
          Color.lerp(backgroundBaseColor, other.backgroundBaseColor, t),
      gradientStartColor:
          Color.lerp(gradientStartColor, other.gradientStartColor, t),
      gradientEndColor: Color.lerp(gradientEndColor, other.gradientEndColor, t),
    );
  }
}
