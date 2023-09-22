import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:yagamy/constant/theme/project_info_theme.dart';
import 'package:yagamy/extension/datetime_extension.dart';
import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/model/project/project_for_card.dart';
import 'package:yagamy/provider/is_notification_refresh_provider.dart';
import 'package:yagamy/provider/project_provider.dart';
import 'package:yagamy/view/common/ui_part/project_card.dart';

class NotificationInfoBody extends ConsumerWidget {
  const NotificationInfoBody({
    required this.notification,
    required this.isFromMessage,
    super.key,
  });

  final ParsedNotification notification;
  final bool isFromMessage;

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
              isFromMessage
                  ? ref
                      .read(isNotificationRefreshProvider.notifier)
                      .update((state) => state + 1)
                  : null;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: horizontalIndent),
                    child: Text(
                      notification.title,
                      style: TextStyle(
                          color: currentTheme.titleColor, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: horizontalIndent),
                    child: Text(
                      notification.sentTime.toDisplayJpString(),
                      style: TextStyle(
                          color: currentTheme.titleColor, fontSize: 13),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: horizontalIndent),
                child: Text(
                  notification.body,
                  style:
                      TextStyle(color: currentTheme.titleColor, fontSize: 15),
                ),
              ),
              notification.url.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: IconButton(
                        icon: const Icon(Icons.web),
                        onPressed: () {
                          launchUrl(Uri.parse(notification.url));
                        },
                        iconSize: 28,
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 40),
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
                    project: ProjectForCard.fromProject(project),
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
