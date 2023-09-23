import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:yagamy/extension/map_type_extension.dart';
import 'package:yagamy/model/map_type.dart';
import 'package:yagamy/provider/selected_floor_type_provider.dart';
import 'package:yagamy/provider/selected_map_type_provider.dart';
import 'package:yagamy/repository/area_image_repository.dart';

class MapSelectButton extends ConsumerStatefulWidget {
  const MapSelectButton({
    required this.mapType,
    required this.text,
    super.key,
  });

  final MapType mapType;
  final String text;

  @override
  ConsumerState<MapSelectButton> createState() => _MapSelectButtonState();
}

class _MapSelectButtonState extends ConsumerState<MapSelectButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 95,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          HapticFeedback.selectionClick();
          ref.read(selectedFloorTypeProvider.notifier).state =
              FloorType.firstFloor;
          ref.read(selectedMapTypeProvider.notifier).state = widget.mapType;
          GoRouter.of(context).go('/map/${widget.mapType.toStringPath()}');
        },
        behavior: HitTestBehavior.opaque,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ref.watch(selectedMapTypeProvider) == widget.mapType
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                  width: 3.5,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              width: 91,
              height: 91,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(14)),
                clipBehavior: Clip.hardEdge,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AreaImageRepository.fetchAreaImageProvider(
                        mapType: widget.mapType,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.text,
              style: TextStyle(
                  color: ref.watch(selectedMapTypeProvider) == widget.mapType
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
