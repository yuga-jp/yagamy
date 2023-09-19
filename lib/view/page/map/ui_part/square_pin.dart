import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SquarePin extends StatelessWidget {
  const SquarePin({
    required this.width,
    required this.height,
    required this.scale,
    required this.path,
    super.key,
  });

  final double width;
  final double height;
  final double scale;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      child: SvgPicture.asset(
        path,
        width: width / scale,
        height: height / scale,
      ),
    );
  }
}
