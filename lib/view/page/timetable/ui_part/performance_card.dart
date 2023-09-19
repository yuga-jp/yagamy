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
      margin: const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
      clipBehavior: Clip.antiAlias,
      child: Ink(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          border:
              Border(bottom: BorderSide(color: bottomBorderColor, width: 3)),
        ),
        height: 80,
        child: Ink(
          color: Colors.black.withOpacity(0.4),
          child: InkWell(
              onTap: () {},
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        time,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
