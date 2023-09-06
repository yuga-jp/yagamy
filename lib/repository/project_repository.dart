import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/model/project/raw_project.dart';
import 'package:yagamy/repository/base_url.dart';

class ProjectRepository {
  static Future<Project> fetchProject(String id) async {
    final response =
        await http.get(Uri.parse('${BaseUrl.baseUrl}/projects/$id'));

    if (response.statusCode == 200) {
      return Project.fromRawProject(
          RawProject.fromJson(json.decode(response.body)));
    } else {
      throw Exception('Failed to load project(projectID:$id)');
    }
  }
}
