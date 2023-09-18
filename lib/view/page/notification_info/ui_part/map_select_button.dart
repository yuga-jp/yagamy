import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yagamy/extension/map_type_extension.dart';

import 'package:yagamy/model/map_type.dart';

class MapSelectButton extends ConsumerStatefulWidget {
  const MapSelectButton({
    required this.mapType,
    required this.text,
    required this.imageUrl,
    super.key,
  });

  final MapType mapType;
  final String text;
  final String imageUrl;

  @override
  ConsumerState<MapSelectButton> createState() => _MapSelectButtonState();
}

class _MapSelectButtonState extends ConsumerState<MapSelectButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 90,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).go('/map/${widget.mapType.toStringPath()}');
        },
        behavior: HitTestBehavior.opaque,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(widget.imageUrl),
                  ),
                ),
                width: 80,
                height: 80,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.text,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
