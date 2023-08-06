import 'package:flutter/material.dart';

AppBar projectInfoAppBar(void Function()? onPressed) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: onPressed,
    ),
    title: Text('aa'),
  );
}
