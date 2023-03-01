import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
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
