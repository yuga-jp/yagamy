import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/model/project/raw_project.dart';

class ProjectRepository {
  static Future<Project> fetchProject(String id) async {
    final response = await rootBundle.loadString('assets/project/project.json');

    for (var data in json.decode(response)) {
      final rawProject = RawProject.fromJson(data);
      if (rawProject.id == id) {
        return Project.fromRawProject(rawProject);
      }
    }
    throw Exception('Failed to load project(projectID:$id)');
  }
}
