import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/map_type.dart';

final selectedMapTypeProvider =
    StateProvider<MapType>((ref) => MapType.wholeArea);
