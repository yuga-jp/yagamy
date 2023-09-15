import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yagamy/gen/assets.gen.dart';

import 'package:yagamy/model/pin_data/pin_type.dart';
import 'package:yagamy/model/project/project_for_card.dart';
import 'package:yagamy/view/page/map/ui_part/project_pin.dart';

class MapPin extends StatelessWidget {
  const MapPin({
    required this.pinType,
    required this.size,
    required this.scale,
    this.project,
    super.key,
  });

  final PinType pinType;
  final Size size;
  final double scale;
  final ProjectForCard? project;

  @override
  Widget build(BuildContext context) {
    switch (pinType) {
      case PinType.headquarter:
        return SvgPicture.asset(
          Assets.map.headquarter.path,
          width: pinType.size.width / scale,
          height: pinType.size.height / scale,
        );
      case PinType.informationCenter:
        return SvgPicture.asset(
          Assets.map.informationCenter.path,
          width: pinType.size.width / scale,
          height: pinType.size.height / scale,
        );
      case PinType.boothHeadquarter:
        return SvgPicture.asset(
          Assets.map.boothHeadquarter.path,
          width: pinType.size.width / scale,
          height: pinType.size.height / scale,
        );
      case PinType.outdoorRestArea:
        return SvgPicture.asset(
          Assets.map.outdoorRestArea.path,
          width: pinType.size.width / scale,
          height: pinType.size.height / scale,
        );
      case PinType.publicPhone:
        return SvgPicture.asset(
          Assets.map.publicPhone.path,
          width: pinType.size.width / scale,
          height: pinType.size.height / scale,
        );
      case PinType.securityOffice:
        return SvgPicture.asset(
          Assets.map.securityOffice.path,
          width: pinType.size.width / scale,
          height: pinType.size.height / scale,
        );
      case PinType.trashCan:
        return SvgPicture.asset(
          Assets.map.trashCan.path,
          width: pinType.size.width / scale,
          height: pinType.size.height / scale,
        );
      case PinType.aed:
        return SvgPicture.asset(
          Assets.map.aed.path,
          width: pinType.size.width / scale,
          height: pinType.size.height / scale,
        );
      case PinType.elevator:
        return SvgPicture.asset(
          Assets.map.elevator.path,
          width: pinType.size.width / scale,
          height: pinType.size.height / scale,
        );
      case PinType.restroom:
        return SvgPicture.asset(
          Assets.map.restroom.path,
          width: pinType.size.width / scale,
          height: pinType.size.height / scale,
        );
      case PinType.restroomMen:
        return SvgPicture.asset(
          Assets.map.restroomMen.path,
          width: pinType.size.width / scale,
          height: pinType.size.height / scale,
        );
      case PinType.restroomWomen:
        return SvgPicture.asset(
          Assets.map.restroomWomen.path,
          width: pinType.size.width / scale,
          height: pinType.size.height / scale,
        );
      case PinType.project:
        return ProjectPin(
          size: size,
          scale: scale,
          project: project!,
        );
      case PinType.defaultPin:
        return Icon(Icons.pin_drop_outlined, size: size.width / scale);
      default:
        return Icon(Icons.pin_drop, size: size.width / scale);
    }
  }
}
