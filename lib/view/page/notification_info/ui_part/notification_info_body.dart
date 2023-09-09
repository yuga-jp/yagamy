import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:yagamy/constant/theme/project_info_theme.dart';
import 'package:yagamy/extension/datetime_extension.dart';
import 'package:yagamy/model/notification/parsed_notification.dart';

class NotificationInfoBody extends StatelessWidget {
  const NotificationInfoBody(this.notification, {super.key});

  final ParsedNotification notification;

  static const double horizontalIndent = 15;

  @override
  Widget build(BuildContext context) {
    final ProjectInfoTheme currentTheme =
        Theme.of(context).extension<ProjectInfoTheme>()!;

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
            ],
          ),
        ),
      ],
    );
  }
}
