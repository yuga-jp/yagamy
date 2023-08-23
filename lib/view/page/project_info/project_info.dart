import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:yagamy/model/project/project.dart';

import 'package:yagamy/provider/project_provider.dart';
import 'package:yagamy/view/page/project_info/ui_part/project_info_body.dart';

class ProjectInfoPage extends ConsumerWidget {
  const ProjectInfoPage(this.id, {super.key});

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Project> project = ref.watch(projectProvider(id!));
    return project.when(
      loading: () {
        return const CircularProgressIndicator();
      },
      error: ((error, stackTrace) {
        return Text('Error: $error');
      }),
      data: (project) {
        return Material(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: CustomScrollView(
            physics:
                const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: <Widget>[
              SliverAppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                ),
                title: const Text('企画紹介'),
                centerTitle: true,
                floating: true,
              ),
              ProjectInfoBody(project),
            ],
          ),
        );
      },
    );
  }
}
