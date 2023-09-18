import 'package:yagamy/model/map_data.dart';
import 'package:yagamy/model/map_type.dart';
import 'package:yagamy/repository/pin_data_repository.dart';
import 'package:yagamy/utility/map_type_to_path.dart';

class MapRepository {
  static Future<List<MapData>> fetchAllMapData() async {
    final List<MapData> allMapData = [];

    for (var mapType in MapType.values) {
      allMapData.add(await fetchMapData(mapType));
    }

    return allMapData;
  }

  static Future<MapData> fetchMapData(MapType mapType) async {
    final svgPath = mapSvgPath(mapType);
    final pinData = await PinDataRepository.fetchPinData(mapType);

    return MapData(mapType: mapType, mapSvgPath: svgPath, pinData: pinData);
  }
}
