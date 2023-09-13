import 'package:flutter/material.dart';

class MapPin extends StatelessWidget {
  const MapPin({required this.size, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.pin_drop_outlined, size: size);
  }
}
