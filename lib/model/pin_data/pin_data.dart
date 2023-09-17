import 'package:yagamy/extension/string_extension.dart';
import 'package:yagamy/model/pin_data/pin_type.dart';

class PinData {
  PinData({
    required this.posX,
    required this.posY,
    required this.pinType,
    this.relatedProjectId,
    this.text,
    this.textAspectRatio,
  });

  PinData.fromJson(Map<String, dynamic> json)
      : posX = double.parse(json['posX']) / 1000,
        posY = -double.parse(json['posY']) / 500,
        pinType = json['pinType'].toString().toPinType(),
        relatedProjectId = json['relatedProjectId'],
        text = json['text'],
        textAspectRatio = json['textAspectRatio'] != null
            ? double.parse(json['textAspectRatio'])
            : null;

  final double posX;
  final double posY;
  final PinType pinType;
  final String? relatedProjectId;
  final String? text;
  final double? textAspectRatio;
}
