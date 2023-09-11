import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:yagamy/model/project/project_for_card.dart';
import 'package:yagamy/view/common/ui_part/project_card.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({required this.projects, super.key});

  final List<ProjectForCard> projects;

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 250),
    vsync: this,
  );
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.linear);

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.value = 0.0;
    _controller.forward();

    return SliverFadeTransition(
      opacity: _animation,
      sliver: SliverFixedExtentList(
        itemExtent: 118.0,
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final project = widget.projects[index];
            return ProjectCard(
              project: project,
              onTap: () {
                GoRouter.of(context).go('/projects/project/${project.id}');
              },
            );
          },
          childCount: widget.projects.length,
        ),
      ),
    );
  }
}
