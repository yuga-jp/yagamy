import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:yagamy/model/project/project.dart';

import 'package:yagamy/view/page/project_info/ui_part/project_info_body.dart';

class ProjectInfoFromNotificationPage extends StatelessWidget {
  const ProjectInfoFromNotificationPage(this.project, {super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: CustomScrollView(
        physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
  }
}
