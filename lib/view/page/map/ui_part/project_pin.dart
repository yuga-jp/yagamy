import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yagamy/extension/map_type_extension.dart';
import 'package:yagamy/model/map_type.dart';

import 'package:yagamy/model/project/project_for_card.dart';

class ProjectPin extends ConsumerWidget {
  const ProjectPin({
    required this.width,
    required this.height,
    required this.scale,
    required this.project,
    required this.locatedMapType,
    super.key,
  });

  final double width;
  final double height;
  final double scale;
  final ProjectForCard project;
  final MapType locatedMapType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).go('/map/${locatedMapType.toStringPath()}/project/${project.id}');
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(project.thumbnailUrl),
                ),
                border: Border.all(color: Colors.purple, width: 2 / scale),
                borderRadius: BorderRadius.circular(8 / scale),
              ),
              width: width / scale,
              height: width / scale,
            ),
          ),
          SizedBox(
            width: width / scale,
            height: (height - width) / scale,
            child: const CustomPaint(
              painter: _IsoscelesTrianglePainter(color: Colors.purple),
            ),
          ),
        ],
      ),
    );
  }
}

class _IsoscelesTrianglePainter extends CustomPainter {
  const _IsoscelesTrianglePainter({this.color = Colors.white});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = color;
    final path = Path();
    path.moveTo(size.width / 2, size.height);
    path.lineTo(size.width * 0.25, 0);
    path.lineTo(size.width * 0.75, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
