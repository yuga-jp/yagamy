import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/search_button_bar_type.dart';
import 'package:yagamy/model/search_button_prop.dart';

class SelectedSearchButtonNotifier extends StateNotifier<SearchButtonProp> {
  SelectedSearchButtonNotifier()
      : super(SearchButtonProp('', SearchButtonBarType.initial));

  void update(SearchButtonProp searchButtonProp) {
    state = searchButtonProp;
  }
}
