import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/map_data.dart';
import 'package:yagamy/repository/map_repository.dart';

final mapsProvider = FutureProvider.autoDispose<List<MapData>>((ref) {
  return MapRepository.fetchAllMapData();
});
