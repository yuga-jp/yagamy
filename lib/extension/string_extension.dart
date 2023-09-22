import 'package:yagamy/model/event_type.dart';
import 'package:yagamy/model/pin_data/pin_type.dart';
import 'package:yagamy/model/sale_siituation_type.dart';

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
      case 'textSub':
        return PinType.textSub;
      case 'defaultPin':
        return PinType.defaultPin;
      default:
        return PinType.defaultPin;
    }
  }

  EventType? toEventType() {
    switch (this) {
      case 'normal':
        return EventType.normal;
      case 'rain':
        return EventType.rain;
      case 'suspension':
        return EventType.suspension;
      default:
        return null;
    }
  }

  SaleSituationType? toSaleSituationType() {
    switch (this) {
      case 'onSale':
        return SaleSituationType.onSale;
      case 'limited':
        return SaleSituationType.limited;
      case 'unavailable':
        return SaleSituationType.unavailable;
      default:
        return null;
    }
  }
}
