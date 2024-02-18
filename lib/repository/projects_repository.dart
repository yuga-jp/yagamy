import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/model/project/raw_project.dart';
import 'package:yagamy/model/timetable_searcher_type.dart';

class ProjectsRepository {
  static Future<List<Project>> fetchProjects() async {
    final response = await rootBundle.loadString('assets/project/project.json');
    final projects = <Project>[];

    for (var project in json.decode(response)) {
      projects.add(Project.fromRawProject(RawProject.fromJson(project)));
    }

    return projects;
  }

  static Future<List<Project>> fetchTimetableProjects(
      TimetableSearcherTypeDay timetableSearcherTypeDay) async {
    final response = await rootBundle.loadString('assets/project/project.json');
    final projects = <Project>[];

    for (var project in json.decode(response)) {
      projects.add(Project.fromRawProject(RawProject.fromJson(project)));
    }

    switch (timetableSearcherTypeDay) {
      case TimetableSearcherTypeDay.firstDay:
        return projects
            .where((project) => project.hoursStartFirstDay != null)
            .toList();
      case TimetableSearcherTypeDay.secondDay:
        return projects
            .where((project) => project.hoursStartSecondDay != null)
            .toList();
    }
  }
}
