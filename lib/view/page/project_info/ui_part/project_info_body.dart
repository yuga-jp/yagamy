import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:yagamy/constant/theme/project_info_theme.dart';
import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/utility/url_launcher_helper.dart';

class ProjectInfoBody extends StatelessWidget {
  const ProjectInfoBody(this.project, {super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final ProjectInfoTheme currentTheme =
        Theme.of(context).extension<ProjectInfoTheme>()!;

    const double horizontalIndent = 15;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          switch (index) {
            case 0:
              return Padding(
                padding: const EdgeInsets.only(
                    left: horizontalIndent,
                    top: 12,
                    right: horizontalIndent,
                    bottom: 5),
                child: Text(
                  project.title,
                  style: TextStyle(
                      color: currentTheme.titleColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              );
            case 1:
              return Padding(
                padding: const EdgeInsets.only(
                    left: horizontalIndent,
                    top: 5,
                    right: horizontalIndent,
                    bottom: 5),
                child: Text(
                  project.shortIntro,
                  style: TextStyle(
                    color: currentTheme.shortIntroColor,
                    fontSize: 14,
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
                  left: horizontalIndent,
                  top: 3,
                  right: horizontalIndent,
                  bottom: 3,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.group_outlined,
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
            case 4:
              return Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 3,
                  right: 23,
                  bottom: 3,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2.5, right: 3),
                      child: Icon(
                        Icons.location_on_outlined,
                        size: 19,
                        color: currentTheme.timePlaceColor,
                      ),
                    ),
                    Text(
                      project.place,
                      style: TextStyle(
                        color: currentTheme.timePlaceColor,
                        fontSize: 19,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.5, right: 3),
                      child: Icon(
                        Icons.schedule_outlined,
                        size: 19,
                        color: currentTheme.timePlaceColor,
                      ),
                    ),
                    Text(
                      project.time,
                      style: TextStyle(
                        color: currentTheme.timePlaceColor,
                        fontSize: 19,
                      ),
                    )
                  ],
                ),
              );
            case 5:
              return const Divider(
                height: 10,
                indent: horizontalIndent,
                endIndent: horizontalIndent,
              );
            case 6:
              return Padding(
                padding: const EdgeInsets.only(
                  left: horizontalIndent,
                  top: 10,
                  right: horizontalIndent,
                  bottom: 18,
                ),
                child: Text(
                  '${project.intro}\n${project.introExtension}',
                  style: TextStyle(
                    color: currentTheme.introColor,
                    fontSize: 14,
                    height: 1.7,
                  ),
                ),
              );
            case 7:
              if (project.groupIntro.isNotEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Text(
                      project.groupName,
                      style: TextStyle(
                          color: currentTheme.titleColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                );
              }
              return null;
            case 8:
              return Padding(
                padding: const EdgeInsets.only(
                  left: horizontalIndent,
                  top: 10,
                  right: horizontalIndent,
                  bottom: 12,
                ),
                child: Text(
                  project.groupIntro,
                  style: TextStyle(
                    color: currentTheme.introColor,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              );
            case 9:
              if (project.twitterId.isNotEmpty ||
                  project.instagramId.isNotEmpty ||
                  project.homepageUrl.isNotEmpty) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    project.twitterId.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: IconButton(
                              icon: SvgPicture.asset(
                                'assets/logo/x-twitter.svg',
                                width: 22,
                                height: 22,
                                colorFilter: ColorFilter.mode(
                                    currentTheme.titleColor!, BlendMode.dst),
                              ),
                              onPressed: () {
                                launchUrlTwitter('keio_seiken');
                              },
                            ),
                          )
                        : const SizedBox.shrink(),
                    project.instagramId.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.instagram),
                              onPressed: () {
                                launchUrlInstagram('keio_piano_society');
                              },
                            ),
                          )
                        : const SizedBox.shrink(),
                    project.homepageUrl.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: IconButton(
                              icon: const Icon(Icons.web),
                              onPressed: () {
                                launchUrl(Uri.parse('https://o-keis.net/'));
                              },
                              iconSize: 28,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                );
              }
              return null;
            default:
              return null;
          }
        },
      ),
    );
  }
}
