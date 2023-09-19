import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/map_type.dart';
import 'package:yagamy/provider/selected_floor_type_provider.dart';

class FloorSelectBar extends StatefulWidget {
  const FloorSelectBar({required this.mapType, super.key});

  final MapType mapType;

  @override
  State<FloorSelectBar> createState() => _FloorSelectBar();
}

class _FloorSelectBar extends State<FloorSelectBar> {
  @override
  Widget build(BuildContext context) {
    return widget.mapType.floorTypes != null
        ? Material(
            elevation: 1.0,
            child: Column(
              children: [
                for (var floorType in widget.mapType.floorTypes!)
                  ButtonUnit(floorType: floorType),
              ],
            ),
          )
        : const SizedBox();
  }
}

class ButtonUnit extends ConsumerStatefulWidget {
  const ButtonUnit({required this.floorType, super.key});

  final FloorType floorType;

  @override
  ConsumerState<ButtonUnit> createState() => _ButtonUnitState();
}

class _ButtonUnitState extends ConsumerState<ButtonUnit> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedFloorTypeProvider.notifier).state = widget.floorType;
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        alignment: Alignment.center,
        color: ref.watch(selectedFloorTypeProvider) == widget.floorType
            ? const Color.fromRGBO(245, 245, 245, 1.0)
            : Colors.white,
        width: 40,
        height: 40,
        child: Text(
          widget.floorType.displayName,
          style: TextStyle(
            color: ref.watch(selectedFloorTypeProvider) == widget.floorType
                ? Theme.of(context).colorScheme.primary
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
