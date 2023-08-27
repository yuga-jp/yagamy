import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/view/page/projects/ui_part/project_card.dart';
import 'package:yagamy/view/page/projects/ui_part/search_button_bar.dart';

class ProjectsBody extends ConsumerWidget {
  const ProjectsBody({
    required this.projects,
    super.key,
  });

  final List<Project> projects;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        const SliverAppBar(
          actions: <Widget>[
            Icon(Icons.search),
            SizedBox(width: 15),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: SearchButtonBar(),
          ),
          floating: true,
          pinned: true,
        ),
        SliverFixedExtentList(
          itemExtent: 118.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final project = projects[index];
              return ProjectCard(
                project: project,
                onTap: () {
                  GoRouter.of(context).go('/projects/project/${project.id}');
                },
              );
            },
            childCount: projects.length,
          ),
        ),
      ],
    );
  }
}
