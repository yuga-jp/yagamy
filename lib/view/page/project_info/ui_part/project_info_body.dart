import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:yagamy/constant/theme/project_info_theme.dart';
import 'package:yagamy/gen/assets.gen.dart';
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
        childCount: 10,
        (BuildContext context, int index) {
          switch (index) {
            // title
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

            // shortIntro
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

            // mainImage
            case 2:
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(project.mainImageUrl),
                      fit: BoxFit.contain,
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

            // groupName
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

            // timePlace
            case 4:
              return Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 3,
                  right: 23,
                  bottom: 3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      project.placeString,
                      style: TextStyle(
                        color: currentTheme.timePlaceColor,
                        fontSize: 19,
                      ),
                    ),
                    const SizedBox(width: 55),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.5, right: 3),
                      child: Icon(
                        Icons.schedule_outlined,
                        size: 19,
                        color: currentTheme.timePlaceColor,
                      ),
                    ),
                    Text(
                      project.hoursString,
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

            // intro
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
              return const SizedBox.shrink();

            // groupIntro
            case 8:
              if (project.groupIntro.isNotEmpty) {
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
              }
              return const SizedBox.shrink();
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
                                Assets.logo.xTwitter.path,
                                width: 22,
                                height: 22,
                                colorFilter: ColorFilter.mode(
                                    currentTheme.titleColor!, BlendMode.dst),
                              ),
                              onPressed: () {
                                launchUrlTwitter(project.twitterId);
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
                                launchUrlInstagram(project.instagramId);
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
                                launchUrl(Uri.parse(project.homepageUrl));
                              },
                              iconSize: 28,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                );
              }
              return const SizedBox.shrink();
              
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
