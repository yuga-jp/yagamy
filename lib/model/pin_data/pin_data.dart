import 'package:yagamy/extension/string_extension.dart';
import 'package:yagamy/model/pin_data/pin_type.dart';

class PinData {
  PinData({
    required this.posX,
    required this.posY,
    required this.pinType,
    required this.relatedProjectId,
  });

  PinData.fromJson(Map<String, dynamic> json)
      : posX = double.parse(json['posX']) / 1000,
        posY = -double.parse(json['posY']) / 1000,
        pinType = json['pinType'].toString().toPinType(),
        relatedProjectId = json['relatedProjectId'];

  final double posX;
  final double posY;
  final PinType pinType;
  final String relatedProjectId;
}
