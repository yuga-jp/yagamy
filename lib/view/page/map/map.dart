import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yagamy/gen/assets.gen.dart';
import 'package:yagamy/model/pin_data/pin_data.dart';
import 'package:yagamy/provider/pin_data_provider.dart';
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
  double initialWidth = 30.0;
  double initialHeight = 30.0;

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<PinData>> pinDataList = ref.watch(pinDataProvider);
    return pinDataList.when(
      loading: () {
        return const SizedBox.shrink();
      },
      error: (error, stackTrace) {
        return const SizedBox.shrink();
      },
      data: (pinDataList) {
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
              for (PinData pinData in pinDataList)
                Positioned(
                  left: pinData.posX,
                  top: pinData.posY,
                  child: GestureDetector(
                    onTap: () {
                      print('aaa');
                    },
                    behavior: HitTestBehavior.deferToChild,
                    child: MapPin(size: initialWidth / scale),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
