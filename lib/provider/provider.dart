import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/searcher_prop.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

final selectedSearcherProvider =
    StateProvider<SearcherProp>((ref) => SearcherProp.initial);
