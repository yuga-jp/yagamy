import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/model/project/raw_project.dart';

class ProjectsRepository {
  static Future<List<Project>> fetchProjects() async {
    final response = await http.get(Uri.parse('https://'));
    final projects = <Project>[];

    if (response.statusCode == 200) {
      for (var project in json.decode(response.body)) {
        projects.add(Project.fromRawProject(RawProject.fromJson(project)));
      }
    } else {
      throw Exception('Failed to load projects.');
    }

    return projects;
  }
}
