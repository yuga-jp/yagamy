import 'package:flutter/material.dart';

import 'package:yagamy/constant/custom_color.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.title,
    this.groupName = '',
    required this.imageUrl,
    this.placeName = '',
    this.time = '',
  }) : super(key: key);

  final String title;
  final String groupName;
  final String imageUrl;
  final String placeName;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: 350,
          height: 110,
          child: Row(
            children: <Widget>[
              _ProjectImage(imageUrl),
              _ProjectInfo(title, groupName, placeName, time),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectImage extends StatelessWidget {
  const _ProjectImage(this.imageUrl);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.fill),
          border: Border.all(color: Colors.white, width: 5),
          borderRadius: BorderRadius.circular(15)),
      width: 110,
      height: 110,
    );
  }
}

class _ProjectInfo extends StatelessWidget {
  const _ProjectInfo(this.title, this.groupName, this.placeName, this.time);

  final String title;
  final String groupName;
  final String placeName;
  final String time;

  Widget _projectPlace(String place) {
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

  Widget _projectTime(String time) {
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

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.only(left: 7, top: 7, bottom: 5),
      width: 240,
      height: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 3),
          Row(
            children: [
              Icon(Icons.group, size: 18, color: CustomColor.groupDisplayColor),
              const SizedBox(width: 5),
              Text(groupName,
                  style: TextStyle(
                      color: CustomColor.groupDisplayColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w300))
            ],
          ),
          const Expanded(child: SizedBox()),
          Row(
            children: <Widget>[
              _projectPlace(placeName),
              _projectTime(time),
            ],
          ),
        ],
      ),
    );
  }
}
