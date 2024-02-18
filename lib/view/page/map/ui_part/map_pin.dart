import 'package:flutter/material.dart';

import 'package:yagamy/gen/assets.gen.dart';
import 'package:yagamy/model/map_type.dart';
import 'package:yagamy/model/pin_data/pin_type.dart';
import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/view/page/map/ui_part/project_pin.dart';
import 'package:yagamy/view/page/map/ui_part/square_pin.dart';
import 'package:yagamy/view/page/map/ui_part/text_pin.dart';

class MapPin extends StatelessWidget {
  const MapPin({
    required this.pinType,
    required this.width,
    required this.height,
    required this.scale,
    this.project,
    this.text,
    this.textAspectRatio,
    required this.locatedMapType,
    super.key,
  });

  final PinType pinType;
  final double width;
  final double height;
  final double scale;
  final Project? project;
  final String? text;
  final double? textAspectRatio;
  final MapType locatedMapType;

  @override
  Widget build(BuildContext context) {
    switch (pinType) {
      case PinType.headquarter:
        return SquarePin(
          width: width,
          height: height,
          scale: scale,
          path: Assets.map.icon.headquarter.path,
        );
      case PinType.informationCenter:
        return SquarePin(
          width: width,
          height: height,
          scale: scale,
          path: Assets.map.icon.informationCenter.path,
        );
      case PinType.boothHeadquarter:
        return SquarePin(
          width: width,
          height: height,
          scale: scale,
          path: Assets.map.icon.boothHeadquarter.path,
        );
      case PinType.outdoorRestArea:
        return SquarePin(
          width: width,
          height: height,
          scale: scale,
          path: Assets.map.icon.outdoorRestArea.path,
        );
      case PinType.publicPhone:
        return SquarePin(
          width: width,
          height: height,
          scale: scale,
          path: Assets.map.icon.publicPhone.path,
        );
      case PinType.securityOffice:
        return SquarePin(
          width: width,
          height: height,
          scale: scale,
          path: Assets.map.icon.securityOffice.path,
        );
      case PinType.trashCan:
        return SquarePin(
          width: width,
          height: height,
          scale: scale,
          path: Assets.map.icon.trashCan.path,
        );
      case PinType.aed:
        return SquarePin(
          width: width,
          height: height,
          scale: scale,
          path: Assets.map.icon.aed.path,
        );
      case PinType.elevator:
        return SquarePin(
          width: width,
          height: height,
          scale: scale,
          path: Assets.map.icon.elevator.path,
        );
      case PinType.restroom:
        return SquarePin(
          width: width,
          height: height,
          scale: scale,
          path: Assets.map.icon.restroom.path,
        );
      case PinType.restroomMen:
        return SquarePin(
          width: width,
          height: height,
          scale: scale,
          path: Assets.map.icon.restroomMen.path,
        );
      case PinType.restroomWomen:
        return SquarePin(
          width: width,
          height: height,
          scale: scale,
          path: Assets.map.icon.restroomWomen.path,
        );
      case PinType.project:
        return ProjectPin(
          width: width,
          height: height,
          scale: scale,
          project: project!,
          locatedMapType: locatedMapType,
        );
      case PinType.text:
        return TextPin(
          height: height,
          scale: scale,
          text: text!,
          textAspectRatio: textAspectRatio!,
        );
      case PinType.textSub:
        return TextPin(
          height: height,
          scale: scale,
          text: text!,
          textAspectRatio: textAspectRatio!,
        );
      case PinType.defaultPin:
        return Icon(Icons.pin_drop_outlined, size: width / scale);
      default:
        return Icon(Icons.pin_drop, size: width / scale);
    }
  }
}
