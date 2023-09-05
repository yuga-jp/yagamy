import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yagamy/constant/theme/notification_theme.dart';
import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/model/notification_priority.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({required this.notification, super.key});

  final ParsedNotification notification;

  Widget _notificationPriorityIcon(NotificationPriority notificationPriority) {
    switch (notificationPriority) {
      case NotificationPriority.high:
        return const Icon(Icons.priority_high, size: 23, color: Colors.red);
      case NotificationPriority.medium:
        return const Icon(Icons.priority_high, size: 17, color: Colors.amber);
      case NotificationPriority.low:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    final NotificationCardTheme currentTheme =
        Theme.of(context).extension<NotificationCardTheme>()!;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: currentTheme.borderColor!, width: 0.5),
        ),
      ),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).go('/notifications/notification/${notification.id}');
        },
        child: Row(
          children: [
            SizedBox(
              width: 55,
              child: _notificationPriorityIcon(notification.priority),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style:
                      TextStyle(color: currentTheme.titleColor, fontSize: 16),
                ),
                Text(
                  notification.body,
                  style: TextStyle(color: currentTheme.bodyColor, fontSize: 14),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
