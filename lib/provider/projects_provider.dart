import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/model/searcher_prop.dart';
import 'package:yagamy/model/timetable_searcher_type.dart';
import 'package:yagamy/repository/projects_repository.dart';

final projectsProvider = FutureProvider<List<Project>>((ref) async {
  return ProjectsRepository.fetchProjects();
});

final timetableFirstDayProvider = FutureProvider<List<Project>>((ref) {
  return ProjectsRepository.fetchTimetableProjects(
      TimetableSearcherTypeDay.firstDay);
});

final timetableSecondDayProvider = FutureProvider<List<Project>>((ref) {
  return ProjectsRepository.fetchTimetableProjects(
      TimetableSearcherTypeDay.secondDay);
});

final filteredProjectsProvider =
    NotifierProvider.family<ProjectsNotifier, List<Project>, SearcherProp>(() {
  return ProjectsNotifier();
});

final filterdTimetableFirstDayProvider =
    NotifierProvider.family<TimetableProjectsNotifier, List<Project>, bool>(
  () {
    return TimetableProjectsNotifier(timetableFirstDayProvider);
  },
);

final filteredTimetableSecondDayProvider =
    NotifierProvider.family<TimetableProjectsNotifier, List<Project>, bool>(
  () {
    return TimetableProjectsNotifier(timetableSecondDayProvider);
  },
);

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

class TimetableProjectsNotifier extends FamilyNotifier<List<Project>, bool> {
  TimetableProjectsNotifier(this.projectsProvider) : super();

  final FutureProvider<List<Project>> projectsProvider;

  @override
  List<Project> build(bool arg) {
    return ref.watch(projectsProvider).value!.where((project) {
      return arg
          ? project.searcherProps.contains(SearcherProp.mainStage)
          : !project.searcherProps.contains(SearcherProp.mainStage);
    }).toList()
      ..sort(((a, b) {
        if (a.hoursStartFirstDay != null && b.hoursStartFirstDay != null) {
          return a.hoursStartFirstDay!.compareTo(b.hoursStartFirstDay!);
        }
        if (a.hoursStartSecondDay != null && b.hoursStartSecondDay != null) {
          return a.hoursStartSecondDay!.compareTo(b.hoursStartSecondDay!);
        }
        throw Exception();
      }));
  }
}
