import 'package:flutter/foundation.dart';
import 'package:yagamy/model/search_button_bar_type.dart';

@immutable
class SearchButtonProp {
  SearchButtonProp(this.name, this.type);

  final String name;
  final SearchButtonBarType type;
  final bool isSelected = false;
  final UniqueKey id = UniqueKey();
}
