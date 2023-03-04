import 'package:flutter/material.dart';

class BorderAroundVertex extends StatelessWidget {
  const BorderAroundVertex({
    Key? key,
    required this.child,
    required this.length,
    this.color = Colors.white,
    this.width = 1.0,
  }) : super(key: key);

  final Widget child;
  final double length;
  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                top: BorderSide(color: color!, width: width),
                left: BorderSide(color: color!, width: width),
              ),
            ),
            width: length,
            height: length,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                top: BorderSide(color: color!, width: width),
                right: BorderSide(color: color!, width: width),
              ),
            ),
            width: length,
            height: length,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                right: BorderSide(color: color!, width: width),
                bottom: BorderSide(color: color!, width: width),
              ),
            ),
            width: length,
            height: length,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(color: color!, width: width),
                left: BorderSide(color: color!, width: width),
              ),
            ),
            width: length,
            height: length,
          ),
        ),
      ],
    );
  }
}
