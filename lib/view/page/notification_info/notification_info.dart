import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yagamy/extension/notification_priority_extension.dart';

import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/provider/notification_provider.dart';

class NotificationInfoPage extends ConsumerWidget {
  const NotificationInfoPage(this.id, {this.data, super.key});

  final String id;
  final ParsedNotification? data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final dynamic notification;
    if (data == null) {
      notification = ref.watch(notificationProvider(id));
    } else {
      notification = data;
    }

    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: notification is AsyncValue<ParsedNotification>
          ? notification.when(
              loading: () {
                return const CircularProgressIndicator();
              },
              error: (error, stackTrace) {
                return Text('Error: $error');
              },
              data: (notification) {
                return CustomScrollView(
                  physics: const ScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        <Widget>[
                          Text(notification.title),
                          Text(notification.body),
                          Text(notification.sentTime.toString()),
                          Text(notification.priority.priorityToString()),
                          Text(notification.relatedProjectId),
                        ],
                      ),
                    ),
                  ],
                );
              },
            )
          : CustomScrollView(
              physics:
                  const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      Text((notification as ParsedNotification).title),
                      Text(notification.body),
                      Text(notification.sentTime.toString()),
                      Text(notification.priority.priorityToString()),
                      Text(notification.relatedProjectId),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
