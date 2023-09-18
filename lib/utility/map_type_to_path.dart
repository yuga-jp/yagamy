import 'package:yagamy/gen/assets.gen.dart';
import 'package:yagamy/model/map_type.dart';

String mapSvgPath(MapType mapType) {
  switch (mapType) {
    case MapType.wholeArea:
      return Assets.map.map.wholeAreaMap.path;
    case MapType.eleven1floor:
      return Assets.map.map.eleven1Map.path;
    case MapType.eleven2floor:
      return Assets.map.map.eleven2Map.path;
    case MapType.eleven3floor:
      return Assets.map.map.eleven3Map.path;
    case MapType.eleven4floor:
      return Assets.map.map.eleven4Map.path;
    case MapType.twelve1floor:
      return Assets.map.map.twelve1Map.path;
    case MapType.twelve2floor:
      return Assets.map.map.twelve2Map.path;
    case MapType.fourteen:
      return Assets.map.map.fourteenMap.path;
    case MapType.eastAreaGround:
      return Assets.map.map.eastAreaGroundMap.path;
  }
}

String mapPinDataPath(MapType mapType) {
  switch (mapType) {
    case MapType.wholeArea:
      return Assets.map.pinData.wholeAreaPin;
    case MapType.eleven1floor:
      return Assets.map.pinData.eleven1Pin;
    case MapType.eleven2floor:
      return Assets.map.pinData.eleven2Pin;
    case MapType.eleven3floor:
      return Assets.map.pinData.eleven3Pin;
    case MapType.eleven4floor:
      return Assets.map.pinData.eleven4Pin;
    case MapType.twelve1floor:
      return Assets.map.pinData.twelve1Pin;
    case MapType.twelve2floor:
      return Assets.map.pinData.twelve2Pin;
    case MapType.fourteen:
      return Assets.map.pinData.fourteenPin;
    case MapType.eastAreaGround:
      return Assets.map.pinData.eastAreaGroundPin;
  }
}
