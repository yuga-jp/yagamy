import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/model/searcher_prop.dart';
import 'package:yagamy/repository/projects_repository.dart';

final projectsProvider = FutureProvider<List<Project>>((ref) async {
  return ProjectsRepository.fetchProjects();
});

final filteredProjectsProvider =
    NotifierProvider.family<ProjectsNotifier, List<Project>, SearcherProp>(() {
  return ProjectsNotifier();
});

class ProjectsNotifier extends FamilyNotifier<List<Project>, SearcherProp> {
  ProjectsNotifier() : super();

  @override
  List<Project> build(SearcherProp arg) {
    return ref.watch(projectsProvider).value!.where((project) {
      return project.searcherProps
          .where((element) => element == arg)
          .isNotEmpty;
    }).toList();
  }
}
