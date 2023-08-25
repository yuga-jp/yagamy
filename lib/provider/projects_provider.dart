import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/model/project/raw_project.dart';
import 'package:yagamy/model/searcher_prop.dart';

final projectsProvider = FutureProvider<List<Project>>((ref) async {
  final content = json.decode(
    await rootBundle.loadString('assets/json/project_mock.json'),
  );

  final projects = <Project>[];

  for (var project in content) {
    projects.add(Project.fromRawProject(RawProject.fromJson(project)));
  }

  return projects;
});

final filteredProjectsProvider =
    NotifierProvider.family<ProjectsNotifier, List<Project>, SearcherProp>(() {
  return ProjectsNotifier();
});

class ProjectsNotifier extends FamilyNotifier<List<Project>, SearcherProp> {
  ProjectsNotifier() : super();

  @override
  List<Project> build(SearcherProp prop) {
    return ref.watch(projectsProvider).value!;
  }
}
