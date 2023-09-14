import 'package:flutter/material.dart';

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
