import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:yagamy/gen/assets.gen.dart';
import 'package:yagamy/model/pin_data/pin_data.dart';
import 'package:yagamy/model/pin_data/pin_point.dart';
import 'package:yagamy/model/project/project_for_card.dart';
import 'package:yagamy/provider/pin_data_provider.dart';
import 'package:yagamy/provider/projects_provider.dart';
import 'package:yagamy/view/page/map/ui_part/map_pin.dart';

class MapPage extends ConsumerStatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  final TransformationController _transformationController =
      TransformationController();
  double scale = 1.0;

  double calcPosX(double posX, double scale, double width) {
    return posX + width * (1 - 1 / scale) / 2;
  }

  double calcPosY(double posY, double scale, double height, PinPoint pinPoint) {
    return pinPoint == PinPoint.center
        ? posY + height * (1 - 1 / scale) / 2
        : posY + height * (1 - 1 / scale);
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<PinData>> pinDataList = ref.watch(pinDataProvider);
    final AsyncValue<List<ProjectForCard>> projects =
        ref.watch(projectsProvider);

    if (pinDataList.isLoading || projects.isLoading) {
      return const SizedBox.shrink();
    } else if (pinDataList.hasError || projects.hasError) {
      return const SizedBox.shrink();
    }

    return InteractiveViewer(
      maxScale: 8.0,
      onInteractionUpdate: (ScaleUpdateDetails details) {
        setState(() {
          scale = _transformationController.value.getMaxScaleOnAxis();
        });
      },
      transformationController: _transformationController,
      child: Stack(
        children: <Widget>[
          SvgPicture.asset(Assets.map.mainMap.path),
          for (PinData pinData in pinDataList.value!)
            Positioned(
              left: calcPosX(
                pinData.posX,
                scale,
                pinData.pinType.size.width,
              ),
              top: calcPosY(
                pinData.posY,
                scale,
                pinData.pinType.size.height,
                pinData.pinType.pinPoint,
              ),
              child: MapPin(
                pinType: pinData.pinType,
                size: pinData.pinType.size,
                scale: scale,
                project: pinData.relatedProjectId.isNotEmpty
                    ? projects.value!
                        .where(
                            (project) => project.id == pinData.relatedProjectId)
                        .first
                    : null,
              ),
            ),
        ],
      ),
    );
  }
}
