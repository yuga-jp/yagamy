import 'package:flutter/material.dart';

import '../theme/custom_color.dart';

Widget projectCard(BuildContext context, String title, String group, String url,
    {String place = "", String time = ""}) {
  return Card(
    elevation: 1,
    shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(Radius.circular(8))),
    child: InkWell(
      child: SizedBox(
        width: 350,
        height: 110,
        child: Row(
          children: <Widget>[
            projectImage(url),
            projectInfo(title, group, place, time),
          ],
        ),
      ),
      onTap: () {},
    ),
  );
}

Widget projectImage(String url) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.fill),
        border: Border.all(color: Colors.white, width: 5),
        borderRadius: BorderRadius.circular(15)),
    width: 110,
    height: 110,
  );
}

Widget projectInfo(String title, String group, String place, String time) {
  return Container(
    padding: const EdgeInsets.only(left: 7, top: 7, bottom: 5),
    width: 240,
    height: 110,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        const SizedBox(height: 3),
        Row(
          children: [
            Icon(Icons.group, size: 18, color: CustomColor.groupDisplayColor),
            const SizedBox(width: 5),
            Text(group,
                style: TextStyle(
                    color: CustomColor.groupDisplayColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w300))
          ],
        ),
        const Expanded(child: SizedBox()),
        Row(
          children: <Widget>[
            projectPlace(place),
            projectTime(time),
          ],
        ),
      ],
    ),
  );
}

Widget projectPlace(String place) {
  return SizedBox(
    width: 125,
    child: Row(
      children: [
        const Icon(Icons.place, size: 18),
        Text(place,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
      ],
    ),
  );
}

Widget projectTime(String time) {
  return SizedBox(
    child: Row(
      children: [
        const Icon(Icons.schedule, size: 18),
        Text(time,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
      ],
    ),
  );
}

Widget contentCard(
    BuildContext context, String title, IconData iconData, void Function() function) {
  return Card(
    elevation: 1,
    shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(Radius.circular(8))),
    child: InkWell(
      onTap: function,
      child: SizedBox(
        width: 350,
        height: 100,
        child: Row(
          children: <Widget>[
            SizedBox(width: 80, child: Center(child: Icon(iconData, size: 45))),
            const SizedBox(width: 5),
            Expanded(
                child: Center(
                    child: Text(title, style: const TextStyle(fontSize: 24)))),
            const SizedBox(width: 50)
          ],
        ),
      ),
    ),
  );
}
