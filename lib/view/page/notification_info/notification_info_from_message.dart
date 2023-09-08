import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/view/page/notification_info/ui_part/notification_info_body.dart';

class NotificationInfoFromMessagePage extends ConsumerWidget {
  const NotificationInfoFromMessagePage(this.notification, {super.key});

  final ParsedNotification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: NotificationInfoBody(notification),
    );
  }
}
