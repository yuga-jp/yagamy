import 'package:flutter/foundation.dart';

@immutable
class Project {
  const Project({
    required this.id,
    required this.name,
    required this.groupName,
    required this.place,
    this.placeDetail = '',
    required this.category,
    required this.timeFirstDay,
    required this.timeSecondDay,
  });

  final String id;
  final String name;
  final String groupName;
  final String place;
  final String placeDetail;
  final String category;
  final List<int> timeFirstDay;
  final List<int> timeSecondDay;
}
