import 'package:flutter/material.dart';

AppBar contentsAppBar() {
  return AppBar(
    actions: const <Widget>[
      Icon(Icons.info_outline),
      SizedBox(width: 15),
    ],
  );
}
