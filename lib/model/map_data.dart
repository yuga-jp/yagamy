import 'package:yagamy/model/map_type.dart';
import 'package:yagamy/model/pin_data/pin_data.dart';

class MapData {
  MapData({
    required this.mapType,
    this.floorType,
    required this.mapSvgPath,
    required this.pinData,
  });

  final MapType mapType;
  final FloorType? floorType;
  final String mapSvgPath;
  final List<PinData> pinData;
}
