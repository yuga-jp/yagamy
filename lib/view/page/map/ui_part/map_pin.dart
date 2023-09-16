import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:yagamy/gen/assets.gen.dart';
import 'package:yagamy/model/pin_data/pin_type.dart';
import 'package:yagamy/model/project/project_for_card.dart';
import 'package:yagamy/view/page/map/ui_part/project_pin.dart';

class MapPin extends StatelessWidget {
  const MapPin({
    required this.pinType,
    required this.width,
    required this.height,
    required this.scale,
    this.project,
    super.key,
  });

  final PinType pinType;
  final double width;
  final double height;
  final double scale;
  final ProjectForCard? project;

  @override
  Widget build(BuildContext context) {
    switch (pinType) {
      case PinType.headquarter:
        return Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: SvgPicture.asset(
            Assets.map.headquarter.path,
            width: width / scale,
            height: height / scale,
          ),
        );
      case PinType.informationCenter:
        return Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: SvgPicture.asset(
            Assets.map.informationCenter.path,
            width: width / scale,
            height: height / scale,
          ),
        );
      case PinType.boothHeadquarter:
        return Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: SvgPicture.asset(
            Assets.map.boothHeadquarter.path,
            width: width / scale,
            height: height / scale,
          ),
        );
      case PinType.outdoorRestArea:
        return Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: SvgPicture.asset(
            Assets.map.outdoorRestArea.path,
            width: width / scale,
            height: height / scale,
          ),
        );
      case PinType.publicPhone:
        return Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: SvgPicture.asset(
            Assets.map.publicPhone.path,
            width: width / scale,
            height: height / scale,
          ),
        );
      case PinType.securityOffice:
        return Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: SvgPicture.asset(
            Assets.map.securityOffice.path,
            width: width / scale,
            height: height / scale,
          ),
        );
      case PinType.trashCan:
        return Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: SvgPicture.asset(
            Assets.map.trashCan.path,
            width: width / scale,
            height: height / scale,
          ),
        );
      case PinType.aed:
        return Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: SvgPicture.asset(
            Assets.map.aed.path,
            width: width / scale,
            height: height / scale,
          ),
        );
      case PinType.elevator:
        return Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: SvgPicture.asset(
            Assets.map.elevator.path,
            width: width / scale,
            height: height / scale,
          ),
        );
      case PinType.restroom:
        return Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: SvgPicture.asset(
            Assets.map.restroom.path,
            width: width / scale,
            height: height / scale,
          ),
        );
      case PinType.restroomMen:
        return Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: SvgPicture.asset(
            Assets.map.restroomMen.path,
            width: width / scale,
            height: height / scale,
          ),
        );
      case PinType.restroomWomen:
        return Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: SvgPicture.asset(
            Assets.map.restroomWomen.path,
            width: width / scale,
            height: height / scale,
          ),
        );
      case PinType.project:
        return ProjectPin(width: width, height: height, scale: scale, project: project!);
      case PinType.defaultPin:
        return Icon(Icons.pin_drop_outlined, size: width / scale);
      default:
        return Icon(Icons.pin_drop, size: width / scale);
    }
  }
}
