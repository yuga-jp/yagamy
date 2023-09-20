import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:yagamy/model/project/project_for_card.dart';
import 'package:yagamy/model/project/raw_project_for_card.dart';
import 'package:yagamy/model/project/timetable_project.dart';
import 'package:yagamy/model/timetable_searcher_type.dart';
import 'package:yagamy/repository/base_url.dart';

class ProjectsRepository {
  static Future<List<ProjectForCard>> fetchProjects() async {
    final response = await http.get(Uri.parse('${BaseUrl.baseUrl}/projects/'));
    final projects = <ProjectForCard>[];

    if (response.statusCode == 200) {
      for (var project in json.decode(response.body)) {
        projects.add(ProjectForCard.fromRawProjectForCard(
            RawProjectForCard.fromJson(project)));
      }
    } else {
      throw Exception('Failed to load projects.');
    }

    return projects;
  }

  static Future<List<TimetableProject>> fetchTimetableProjects(
      TimetableSearcherTypeDay timetableSearcherTypeDay) async {
    final response = await http.get(Uri.parse('${BaseUrl.baseUrl}/projects/'));
    final projects = <TimetableProject>[];

    if (response.statusCode == 200) {
      for (var project in json.decode(response.body)) {
        projects.add(TimetableProject.fromRawProjectForCard(
            RawProjectForCard.fromJson(project)));
      }
    } else {
      throw Exception('Failed to load projects.');
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
