import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:yagamy/model/map_data.dart';
import 'package:yagamy/model/map_type.dart';
import 'package:yagamy/model/pin_data/pin_data.dart';
import 'package:yagamy/model/project/project_for_card.dart';
import 'package:yagamy/provider/map_provider.dart';
import 'package:yagamy/provider/projects_provider.dart';
import 'package:yagamy/view/page/map/ui_part/map_pin.dart';

class MapViewer extends ConsumerStatefulWidget {
  const MapViewer({required this.mapType, super.key});

  final MapType mapType;

  @override
  ConsumerState<MapViewer> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapViewer> {
  final TransformationController _transformationController =
      TransformationController();

  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuerySize = MediaQuery.sizeOf(context);

    final AsyncValue<MapData> mapData = ref.watch(mapProvider(widget.mapType));
    final AsyncValue<List<ProjectForCard>> projects =
        ref.watch(projectsProvider);

    if (mapData.isLoading || projects.isLoading) {
      return const SizedBox.shrink();
    } else if (mapData.hasError || projects.hasError) {
      return const SizedBox.shrink();
    }

    return InteractiveViewer(
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
              height: mediaQuerySize.width / 2,
              child: SvgPicture.asset(
                mapData.value!.mapSvgPath,
                alignment: Alignment.center,
              ),
            ),
            if (scale > 0.9)
              for (PinData pinData in mapData.value!.pinData)
                SizedBox(
                  height: mediaQuerySize.width / 2,
                  child: Align(
                    alignment: Alignment(pinData.posX, pinData.posY),
                    child: MapPin(
                      pinType: pinData.pinType,
                      width: pinData.pinType.size.width *
                          mediaQuerySize.width /
                          500,
                      height: pinData.pinType.size.height *
                          mediaQuerySize.width /
                          500,
                      scale: scale,
                      project: pinData.relatedProjectId != null
                          ? projects.value!
                              .where((project) =>
                                  project.id == pinData.relatedProjectId)
                              .first
                          : null,
                      text: pinData.text,
                      textAspectRatio: pinData.textAspectRatio,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
