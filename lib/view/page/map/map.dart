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

  double calcPosX(double posX, double scale, double standardPinWidth) {
    return posX + standardPinWidth * (1 - 1 / scale) / 2;
  }

  double calcPosY(
      double posY, double scale, double standardPinHeight, PinPoint pinPoint) {
    return pinPoint == PinPoint.center
        ? posY + standardPinHeight * (1 - 1 / scale) / 2
        : posY + standardPinHeight * (1 - 1 / scale);
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

    return Stack(
      alignment: Alignment.center,
      children: [
        InteractiveViewer(
          maxScale: 8.0,
          minScale: 1.0,
          onInteractionUpdate: (ScaleUpdateDetails details) {
            setState(() {
              scale = _transformationController.value.getMaxScaleOnAxis();
            });
          },
          transformationController: _transformationController,
          child: Container(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.width / 2,
                  child: SvgPicture.asset(
                    Assets.map.wholeAreaMap.path,
                    alignment: Alignment.center,
                  ),
                ),
                if (scale > 0.9)
                  for (PinData pinData in pinDataList.value!)
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 2,
                      child: Align(
                        alignment: Alignment(pinData.posX, pinData.posY),
                        child: MapPin(
                          pinType: pinData.pinType,
                          width: pinData.pinType.size.width *
                              MediaQuery.of(context).size.width /
                              500,
                          height: pinData.pinType.size.height *
                              MediaQuery.of(context).size.width /
                              500,
                          scale: scale,
                          project: pinData.relatedProjectId.isNotEmpty
                              ? projects.value!
                                  .where((project) =>
                                      project.id == pinData.relatedProjectId)
                                  .first
                              : null,
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.2,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: DraggableScrollableSheet(
              initialChildSize: 0.38,
              minChildSize: 0.38,
              snap: true,
              snapSizes: const <double>[0.38, 0.5, 1.0],
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Material(
                  color: const Color.fromRGBO(245, 245, 245, 1.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: ListView(
                    controller: scrollController,
                    physics:
                        const ScrollPhysics(parent: ClampingScrollPhysics()),
                    padding: const EdgeInsets.only(top: 10),
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(200, 200, 200, 1.0),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 100,
                        height: 8,
                        margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.44,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
