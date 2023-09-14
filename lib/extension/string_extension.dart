import 'package:yagamy/model/pin_data/pin_type.dart';

extension StringExtension on String {
  PinType toPinType() {
    switch (this) {
      case 'headquarter':
        return PinType.headquarter;
      case 'informationCenter':
        return PinType.informationCenter;
      case 'boothHeadquarter':
        return PinType.boothHeadquarter;
      case 'outdoorRestArea':
        return PinType.outdoorRestArea;
      case 'publicPhone':
        return PinType.publicPhone;
      case 'securityOffice':
        return PinType.securityOffice;
      case 'trashCan':
        return PinType.trashCan;
      case 'aed':
        return PinType.aed;
      case 'elevator':
        return PinType.elevator;
      case 'restroom':
        return PinType.restroom;
      case 'restroomMen':
        return PinType.restroomMen;
      case 'restroomWomen':
        return PinType.restroomWomen;
      case 'project':
        return PinType.project;
      case 'text':
        return PinType.text;
      case 'defaultPin':
        return PinType.defaultPin;
      default:
        return PinType.defaultPin;
    }
  }
}
