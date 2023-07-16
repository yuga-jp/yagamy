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
