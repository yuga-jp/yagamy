import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/project/project_for_card.dart';
import 'package:yagamy/model/project/timetable_project.dart';
import 'package:yagamy/model/searcher_prop.dart';
import 'package:yagamy/model/timetable_searcher_type.dart';
import 'package:yagamy/repository/projects_repository.dart';

final projectsProvider = FutureProvider<List<ProjectForCard>>((ref) async {
  return ProjectsRepository.fetchProjects();
});

final timetableFirstDayProvider = FutureProvider<List<TimetableProject>>((ref) {
  return ProjectsRepository.fetchTimetableProjects(
      TimetableSearcherTypeDay.firstDay);
});

final timetableSecondDayProvider =
    FutureProvider<List<TimetableProject>>((ref) {
  return ProjectsRepository.fetchTimetableProjects(
      TimetableSearcherTypeDay.secondDay);
});

final filteredProjectsProvider = NotifierProvider.family<ProjectsNotifier,
    List<ProjectForCard>, SearcherProp>(() {
  return ProjectsNotifier();
});

final filterdTimetableFirstDayProvider = NotifierProvider.family<
    TimetableProjectsNotifier, List<TimetableProject>, bool>(
  () {
    return TimetableProjectsNotifier(timetableFirstDayProvider);
  },
);

final filteredTimetableSecondDayProvider = NotifierProvider.family<
    TimetableProjectsNotifier, List<TimetableProject>, bool>(
  () {
    return TimetableProjectsNotifier(timetableSecondDayProvider);
  },
);

class ProjectsNotifier
    extends FamilyNotifier<List<ProjectForCard>, SearcherProp> {
  ProjectsNotifier() : super();

  @override
  List<ProjectForCard> build(SearcherProp arg) {
    return ref.watch(projectsProvider).value!.where((project) {
      return project.searcherProps
          .where((element) => element == arg)
          .isNotEmpty;
    }).toList();
  }
}

class TimetableProjectsNotifier
    extends FamilyNotifier<List<TimetableProject>, bool> {
  TimetableProjectsNotifier(this.projectsProvider) : super();

  final FutureProvider<List<TimetableProject>> projectsProvider;

  @override
  List<TimetableProject> build(bool arg) {
    return ref.watch(projectsProvider).value!.where((project) {
      return arg
          ? project.searcherProp == SearcherProp.mainStage
          : project.searcherProp != SearcherProp.mainStage;
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
