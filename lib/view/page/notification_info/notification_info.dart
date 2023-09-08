import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:yagamy/extension/notification_priority_extension.dart';
import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/provider/notification_provider.dart';

class NotificationInfoPage extends ConsumerWidget {
  const NotificationInfoPage(this.id, {super.key});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ParsedNotification> notification =
        ref.watch(notificationProvider(id));

    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: notification.when(
        loading: () {
          return const CircularProgressIndicator();
        },
        error: (error, stackTrace) {
          return Text('Error: $error');
        },
        data: (notification) {
          return CustomScrollView(
            physics:
                const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverAppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                ),
                title: const Text('企画紹介'),
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
        },
      ),
    );
  }
}
