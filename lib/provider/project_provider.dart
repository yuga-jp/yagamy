import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/repository/project_repository.dart';

final projectProvider =
    FutureProvider.autoDispose.family<Project, String>((ref, id) async {
  return ProjectRepository.fetchProject(id);
});
