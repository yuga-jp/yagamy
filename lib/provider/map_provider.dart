import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yagamy/model/map_data.dart';
import 'package:yagamy/model/map_type.dart';
import 'package:yagamy/provider/maps_provider.dart';

final mapProvider =
    FutureProvider.autoDispose.family<MapData, MapType>((ref, mapType) {
  return ref
      .watch(mapsProvider)
      .value!
      .where((mapData) => mapData.mapType == mapType)
      .first;
});
