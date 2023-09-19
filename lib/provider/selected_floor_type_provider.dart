import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/map_type.dart';

final selectedFloorTypeProvider =
    StateProvider<FloorType>((ref) => FloorType.firstFloor);
