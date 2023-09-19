import 'package:flutter/material.dart';

class TextPin extends StatelessWidget {
  const TextPin({
    required this.height,
    required this.scale,
    required this.text,
    required this.textAspectRatio,
    super.key,
  });

  final double height;
  final double scale;
  final String text;
  final double textAspectRatio;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: height * textAspectRatio,
      height: height,
      child: Container(
        alignment: Alignment.center,
        width: height * textAspectRatio / scale,
        height: height / scale,
        child: FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
