import 'package:flutter/material.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({Key? key}) : super(key: key);

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yagamy'),
        actions: const <Widget>[
          Icon(Icons.account_circle),
          SizedBox(width: 15)
        ],
      ),
    );
  }
}
