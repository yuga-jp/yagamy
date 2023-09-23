import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yagamy/constant/theme/notification_theme.dart';
import 'package:yagamy/extension/datetime_extension.dart';
import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/model/notification_priority.dart';

class NotificationCard extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final NotificationCardTheme currentTheme =
        Theme.of(context).extension<NotificationCardTheme>()!;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: currentTheme.borderColor!, width: 0.5),
        ),
      ),
      child: InkWell(
        onTap: () {
          GoRouter.of(context)
              .go('/notifications/notification/${notification.id}');
        },
        child: Row(
          children: [
            const SizedBox(width: 5),
            SizedBox(
              width: 40,
              child: _notificationPriorityIcon(notification.priority),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 25,
                          child: Text(
                            notification.title,
                            style: TextStyle(
                                color: currentTheme.titleColor, fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        notification.sentTime.toNotificationPageJpString(),
                        style: TextStyle(color: currentTheme.bodyColor),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  Expanded(
                    child: Text(
                      notification.body,
                      style: TextStyle(
                        color: currentTheme.bodyColor,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
