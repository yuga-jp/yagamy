import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/provider/notification_provider.dart';
import 'package:yagamy/view/page/notification_info/ui_part/notification_info_body.dart';

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
          return const CircularProgressIndicator.adaptive();
        },
        error: (error, stackTrace) {
          return Text('Error: $error');
        },
        data: (notification) {
          return NotificationInfoBody(
            notification: notification,
            isFromMessage: false,
          );
        },
      ),
    );
  }
}
