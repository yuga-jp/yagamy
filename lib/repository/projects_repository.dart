import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:yagamy/model/project/project_for_card.dart';
import 'package:yagamy/model/project/raw_project_for_card.dart';
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
}
