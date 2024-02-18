import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:yagamy/constant/theme/project_info_theme.dart';
import 'package:yagamy/extension/datetime_extension.dart';
import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/provider/project_provider.dart';
import 'package:yagamy/view/common/ui_part/project_card.dart';

class NotificationInfoBody extends ConsumerWidget {
  const NotificationInfoBody({
    required this.notification,
    super.key,
  });

  final ParsedNotification notification;

  static const double horizontalIndent = 15;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProjectInfoTheme currentTheme =
        Theme.of(context).extension<ProjectInfoTheme>()!;

    final AsyncValue<Project> project =
        ref.watch(projectProvider(notification.relatedProjectId));

    return CustomScrollView(
      physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        SliverAppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          title: const Text('通知詳細'),
          centerTitle: true,
          floating: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: horizontalIndent),
                child: Text(
                  notification.title,
                  style:
                      TextStyle(color: currentTheme.titleColor, fontSize: 20),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: horizontalIndent),
                  child: Text(
                    notification.sentTime.toDisplayJpString(),
                    style: TextStyle(
                        color: currentTheme.groupNameColor, fontSize: 13),
                  ),
                ),
              ),
              const Divider(
                indent: horizontalIndent,
                endIndent: horizontalIndent,
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: horizontalIndent),
                child: Text(
                  notification.body,
                  style:
                      TextStyle(color: currentTheme.titleColor, fontSize: 15),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  notification.urlTitle != null
                      ? Text(
                          '${notification.urlTitle!} :',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : const SizedBox(),
                  notification.url.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: IconButton(
                            icon: const Icon(Icons.open_in_browser_outlined),
                            onPressed: () {
                              launchUrl(Uri.parse(notification.url));
                            },
                            iconSize: 28,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              const SizedBox(height: 35),
              project.when(
                loading: () {
                  return Container(
                    alignment: Alignment.center,
                    height: 40,
                    margin: const EdgeInsets.only(top: 40),
                    child: const CircularProgressIndicator.adaptive(),
                  );
                },
                error: (error, stackTrace) {
                  return const SizedBox.shrink();
                },
                data: (project) {
                  return ProjectCard(
                    project: project,
                    onTap: () {
                      GoRouter.of(context)
                          .go('/notifications/project/${project.id}');
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
