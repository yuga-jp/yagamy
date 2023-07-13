import 'package:flutter/material.dart';

AppBar homeAppBar() {
  return AppBar(
    title: const Text('Yagamy'),
    actions: const <Widget>[
      Icon(Icons.account_circle_outlined),
      SizedBox(width: 15),
    ],
  );
}

AppBar contentsAppBar() {
  return AppBar(
    actions: const <Widget>[
      Icon(Icons.info_outline),
      SizedBox(width: 15),
    ],
  );
}
