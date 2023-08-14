import 'package:flutter/material.dart';

import 'package:yagamy/constant/theme/project_info_theme.dart';
import 'package:yagamy/model/project/project.dart';

class ProjectInfoBody extends StatelessWidget {
  const ProjectInfoBody(this.project, {super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final ProjectInfoTheme currentTheme =
        Theme.of(context).extension<ProjectInfoTheme>()!;

    const double leftPadding = 15;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          switch (index) {
            case 0:
              return Padding(
                padding: const EdgeInsets.only(
                    left: leftPadding, top: 12, right: 0, bottom: 5),
                child: Text(
                  project.title,
                  style: TextStyle(
                      color: currentTheme.titleColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w700),
                ),
              );
            case 1:
              return Padding(
                padding: const EdgeInsets.only(
                    left: leftPadding, top: 5, right: 0, bottom: 5),
                child: Text(
                  project.shortIntro,
                  style: TextStyle(
                    color: currentTheme.shortIntroColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            case 2:
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(project.mainImageUrl),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 3 / 4,
                margin: const EdgeInsets.only(
                  left: 7,
                  top: 8,
                  right: 7,
                  bottom: 12,
                ),
                clipBehavior: Clip.antiAlias,
              );
            case 3:
              return Padding(
                padding: const EdgeInsets.only(
                  left: leftPadding,
                  top: 3,
                  right: 0,
                  bottom: 3,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.group,
                      size: 18,
                      color: currentTheme.groupNameColor,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      project.groupName,
                      style: TextStyle(
                          color: currentTheme.groupNameColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              );
            default:
              return null;
          }
        },
      ),
    );
  }
}
