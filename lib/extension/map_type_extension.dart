import 'package:yagamy/model/map_type.dart';

extension MapTypeExtension on MapType {
  String toStringPath() {
    switch (this) {
      case MapType.wholeArea:
        return 'whole_area';
      case MapType.eleven3floor:
        return 'eleven';
      case MapType.twelve1floor:
        return 'twelve';
      case MapType.fourteen:
        return 'fourteen';
      case MapType.eastAreaGround:
        return 'east_area_ground';
      default:
        return '';
    }
  }
}
