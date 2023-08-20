import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/project/project.dart';

class ProjectsNotifier extends StateNotifier<List<Project>> {
  ProjectsNotifier() : super([]);
}

final projectsProvider = FutureProvider<List<Project>>((ref) async {
  final content = json.decode(
    await rootBundle.loadString('assets/json/project_mock.json'),
  );

  final projects = <Project>[];

  for (var project in content) {
    projects.add(Project.fromJson(project));
  }

  return projects;
});
