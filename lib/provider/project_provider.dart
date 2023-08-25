import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/provider/projects_provider.dart';

final projectProvider =
    FutureProvider.autoDispose.family<Project, int>((ref, id) async {
  final projects = ref.watch(projectsProvider);
  return projects.maybeWhen(
    orElse: () {
      return Project.empty();
    },
    data: (projects) {
      return projects.where((project) => id == project.id).first;
    },
  );
});
