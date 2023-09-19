import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:yagamy/model/map_type.dart';
import 'package:yagamy/provider/selected_map_type_provider.dart';
import 'package:yagamy/view/page/map/ui_part/floor_select_bar.dart';
import 'package:yagamy/view/page/map/ui_part/map_select_button.dart';

class MapPage extends ConsumerStatefulWidget {
  const MapPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuerySize = MediaQuery.sizeOf(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        widget.navigationShell,
        Positioned(
          top: mediaQuerySize.height * 0.4,
          left: mediaQuerySize.width * 0.05,
          child: FloorSelectBar(mapType: ref.watch(selectedMapTypeProvider)),
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: mediaQuerySize.width,
            height: mediaQuerySize.height -
                (MediaQuery.of(context).viewPadding.top +
                    MediaQuery.of(context).viewPadding.bottom +
                    kBottomNavigationBarHeight),
            child: DraggableScrollableSheet(
              initialChildSize: 0.22,
              minChildSize: 0.22,
              maxChildSize: 0.8,
              snap: true,
              snapSizes: const <double>[0.22, 0.5, 0.8],
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
                    padding: const EdgeInsets.only(top: 7),
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(200, 200, 200, 1.0),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 6,
                        margin: EdgeInsets.symmetric(
                          horizontal: mediaQuerySize.width * 0.44,
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 135,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          itemBuilder: (BuildContext context, int index) {
                            return MapSelectButton(
                              mapType: MapType.values
                                  .where((mapType) =>
                                      mapType.displayName.isNotEmpty)
                                  .toList()[index],
                              text: MapType.values
                                  .where((mapType) =>
                                      mapType.displayName.isNotEmpty)
                                  .toList()[index]
                                  .displayName,
                              imageUrl: 'https://picsum.photos/600',
                            );
                          },
                          itemCount: MapType.values
                              .where(
                                  (mapType) => mapType.displayName.isNotEmpty)
                              .length,
                        ),
                      ),
                      const SizedBox(height: 30),
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
