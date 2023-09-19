import 'package:yagamy/model/notification/raw_notification.dart';
import 'package:yagamy/model/notification_priority.dart';
import 'package:yagamy/utility/to_notification_priority.dart';

class ParsedNotification {
  ParsedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.sentTime,
    required this.priority,
    required this.relatedProjectId,
  });

  ParsedNotification.fromRawNotification(RawNotification rawNotification)
      : id = rawNotification.id,
        title = rawNotification.title,
        body = rawNotification.body,
        sentTime = rawNotification.sentTime.add(const Duration(hours: 9)),
        priority = toNotificationPriority(rawNotification.priority),
        relatedProjectId = rawNotification.relatedProjectId;

  ParsedNotification.empty({
    this.id = '0',
    this.title = '',
    this.body = '',
    this.priority = NotificationPriority.low,
    this.relatedProjectId = '0',
  }) : sentTime = DateTime.now();

  final String id;
  final String title;
  final String body;
  final DateTime sentTime;
  final NotificationPriority priority;
  final String relatedProjectId;
}
