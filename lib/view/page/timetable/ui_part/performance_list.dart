import 'package:flutter/material.dart';

import 'package:yagamy/model/timetable_searcher_type.dart';
import 'package:yagamy/view/page/timetable/ui_part/performance_card.dart';

class PerformanceList extends StatefulWidget {
  const PerformanceList({required this.day, required this.place, super.key});

  final TimetableSearcherTypeDay day;
  final TimetableSearcherTypePlace place;

  @override
  State<PerformanceList> createState() => _PerformanceListState();
}

class _PerformanceListState extends State<PerformanceList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        PerformanceCard(
          title: 'title',
          imageUrl: 'https://picsum.photos/500/500',
          time: '10:00-10:30',
        )
      ],
    );
  }
}
