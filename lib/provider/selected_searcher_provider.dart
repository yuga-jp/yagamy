import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/searcher_prop.dart';

final selectedSearcherProvider =
    StateProvider<SearcherProp>((ref) => SearcherProp.initial);
