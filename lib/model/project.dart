import 'package:yagamy/model/searcher_prop.dart';

class Project {
  Project({
    required this.name,
    required this.groupName,
    required this.category,
    required this.place,
    this.placeDetail = '',
  });

  final String name;

  final String groupName;

  final SearcherProp category;

  final SearcherProp place;

  final String placeDetail;
}
