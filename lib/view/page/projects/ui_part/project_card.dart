import 'package:flutter/material.dart';

import 'package:yagamy/constant/theme/project_card_theme.dart';
import 'package:yagamy/model/project/project.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.project,
    this.onTap,
  }) : super(key: key);

  final Project project;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).extension<ProjectCardTheme>()!.color!,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      margin: const EdgeInsets.only(left: 10, top: 4, right: 10, bottom: 4),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 110,
          child: Row(
            children: <Widget>[
              _ProjectImage(project.thumbnailUrl),
              _ProjectInfo(project.title, project.groupName, project.placeString,
                  project.hoursString),
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
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.fill),
          border: Border.all(
            color: Theme.of(context).extension<ProjectCardTheme>()!.color!,
            width: 5,
          ),
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

  Widget _projectPlace(String place, Color textColor) {
    return SizedBox(
      width: 135,
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined, size: 18),
          Text(place,
              style: TextStyle(
                  color: textColor, fontSize: 15, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }

  Widget _projectTime(String time, Color textColor) {
    return SizedBox(
      child: Row(
        children: [
          const Icon(Icons.schedule, size: 18),
          Text(time,
              style: TextStyle(
                  color: textColor, fontSize: 15, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ProjectCardTheme currentTheme =
        Theme.of(context).extension<ProjectCardTheme>()!;
    return Container(
      padding: const EdgeInsets.only(left: 7, top: 7, bottom: 5),
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
              Icon(Icons.group_outlined,
                  size: 18, color: currentTheme.groupDisplayColor!),
              const SizedBox(width: 5),
              Text(
                groupName,
                style: TextStyle(
                  color: currentTheme.groupDisplayColor!,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          Row(
            children: <Widget>[
              _projectPlace(placeName, currentTheme.textColor!),
              _projectTime(time, currentTheme.textColor!),
            ],
          ),
        ],
      ),
    );
  }
}
