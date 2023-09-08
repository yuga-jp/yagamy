import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:yagamy/extension/notification_priority_extension.dart';
import 'package:yagamy/model/notification/parsed_notification.dart';

class NotificationInfoBody extends StatelessWidget {
  const NotificationInfoBody(this.notification, {super.key});

  final ParsedNotification notification;

  @override
  Widget build(BuildContext context) {
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
              Text(notification.title),
              Text(notification.body),
              Text(notification.sentTime.toString()),
              Text(notification.priority.priorityToString()),
              Text(notification.relatedProjectId.toString()),
            ],
          ),
        ),
      ],
    );
  }
}
