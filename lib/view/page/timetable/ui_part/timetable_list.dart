import 'package:flutter/material.dart';

import 'package:yagamy/model/project/timetable_project.dart';
import 'package:yagamy/model/timetable_searcher_type.dart';
import 'package:yagamy/view/page/timetable/ui_part/timetable_card.dart';

class TimetableList extends StatefulWidget {
  const TimetableList({required this.project, required this.day, super.key});

  final List<TimetableProject> project;
  final TimetableSearcherTypeDay day;

  @override
  State<TimetableList> createState() => _TimetableListState();
}

class _TimetableListState extends State<TimetableList>
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
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final project = widget.project[index];
            return TimetableCard(
              project: project,
              day: widget.day,
            );
          },
          childCount: widget.project.length,
        ),
      ),
    );
  }
}
