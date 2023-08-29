import 'package:flutter/material.dart';

class ProjectsBodyTheme extends ThemeExtension<ProjectsBodyTheme> {
  const ProjectsBodyTheme({
    required this.backgroundBaseColor,
    required this.gradientStartColor,
    required this.gradientEndColor,
  });

  final Color? backgroundBaseColor;
  final Color? gradientStartColor;
  final Color? gradientEndColor;

  @override
  ProjectsBodyTheme copyWith({
    Color? backgroundBaseColor,
    Color? gradientStartColor,
    Color? gradientEndColor,
  }) {
    return ProjectsBodyTheme(
      backgroundBaseColor: backgroundBaseColor ?? this.backgroundBaseColor,
      gradientStartColor: gradientStartColor ?? this.gradientStartColor,
      gradientEndColor: gradientEndColor ?? this.gradientEndColor,
    );
  }

  @override
  ProjectsBodyTheme lerp(ProjectsBodyTheme? other, double t) {
    if (other is! ProjectsBodyTheme) {
      return this;
    }
    return ProjectsBodyTheme(
      backgroundBaseColor:
          Color.lerp(backgroundBaseColor, other.backgroundBaseColor, t),
      gradientStartColor:
          Color.lerp(gradientStartColor, other.gradientStartColor, t),
      gradientEndColor: Color.lerp(gradientEndColor, other.gradientEndColor, t),
    );
  }
}
