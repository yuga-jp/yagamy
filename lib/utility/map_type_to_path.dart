import 'package:yagamy/gen/assets.gen.dart';
import 'package:yagamy/model/map_type.dart';

String mapSvgPath(MapType mapType, FloorType? floorType) {
  switch (mapType) {
    case MapType.wholeArea:
      return Assets.map.map.wholeAreaMap.path;
    case MapType.eleven:
      switch (floorType) {
        case FloorType.secondBasement:
          return Assets.map.map.eleven1Map.path;
        case FloorType.firstBasement:
          return Assets.map.map.eleven2Map.path;
        case FloorType.firstFloor:
          return Assets.map.map.eleven3Map.path;
        case FloorType.secondFloor:
          return Assets.map.map.eleven4Map.path;
        default:
          return Assets.map.map.eleven3Map.path;
      }
    case MapType.twelve:
      switch (floorType) {
        case FloorType.firstFloor:
          return Assets.map.map.twelve1Map.path;
        case FloorType.secondFloor:
          return Assets.map.map.twelve2Map.path;
        default:
          return Assets.map.map.twelve1Map.path;
      }
    case MapType.fourteen:
      return Assets.map.map.fourteenMap.path;
    case MapType.eastAreaGround:
      return Assets.map.map.eastAreaGroundMap.path;
  }
}

String mapPinDataPath(MapType mapType, FloorType? floorType) {
  switch (mapType) {
    case MapType.wholeArea:
      return Assets.map.pinData.wholeAreaPin;
    case MapType.eleven:
      switch (floorType) {
        case FloorType.secondBasement:
          return Assets.map.pinData.eleven1Pin;
        case FloorType.firstBasement:
          return Assets.map.pinData.eleven2Pin;
        case FloorType.firstFloor:
          return Assets.map.pinData.eleven3Pin;
        case FloorType.secondFloor:
          return Assets.map.pinData.eleven4Pin;
        default:
          return Assets.map.pinData.eleven3Pin;
      }
    case MapType.twelve:
      switch (floorType) {
        case FloorType.firstFloor:
          return Assets.map.pinData.twelve1Pin;
        case FloorType.secondFloor:
          return Assets.map.pinData.twelve2Pin;
        default:
          return Assets.map.pinData.twelve1Pin;
      }
    case MapType.fourteen:
      return Assets.map.pinData.fourteenPin;
    case MapType.eastAreaGround:
      return Assets.map.pinData.eastAreaGroundPin;
  }
}
