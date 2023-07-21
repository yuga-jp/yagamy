import 'package:flutter/material.dart';

class PerformanceCard extends StatelessWidget {
  const PerformanceCard({
    required this.title,
    this.bottomBorderColor = Colors.blue,
    required this.imageUrl,
    this.time = '',
    super.key,
  });

  final String title;
  final Color bottomBorderColor;
  final String imageUrl;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Ink(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
            border:
                Border(bottom: BorderSide(color: bottomBorderColor, width: 3))),
        width: 350,
        height: 80,
        child: InkWell(
            onTap: () {},
            child: Align(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                child: Column(
                  children: <Widget>[
                    Text(title),
                    Text(time),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
