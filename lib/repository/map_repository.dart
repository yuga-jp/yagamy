import 'package:yagamy/model/map_data.dart';
import 'package:yagamy/model/map_type.dart';
import 'package:yagamy/repository/pin_data_repository.dart';
import 'package:yagamy/utility/map_type_to_path.dart';

class MapRepository {
  static Future<List<MapData>> fetchAllMapData() async {
    final List<MapData> allMapData = [];

    for (var mapType in MapType.values) {
      if (mapType.floorTypes == null) {
        allMapData.add(await fetchMapData(mapType, null));
      } else {
        for (var floorType in mapType.floorTypes!) {
          allMapData.add(await fetchMapData(mapType, floorType));
        }
      }
    }

    return allMapData;
  }

  static Future<MapData> fetchMapData(
    MapType mapType,
    FloorType? floorType,
  ) async {
    final svgPath = mapSvgPath(mapType, floorType);

    final pinData = await PinDataRepository.fetchPinData(mapType, floorType);

    return MapData(
      mapType: mapType,
      floorType: floorType,
      mapSvgPath: svgPath,
      pinData: pinData,
    );
  }
}
