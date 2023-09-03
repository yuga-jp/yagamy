import 'package:yagamy/model/notification/raw_notification.dart';
import 'package:yagamy/model/notification_priority.dart';
import 'package:yagamy/utility/to_notification_priority.dart';

class ParsedNotification {
  ParsedNotification({
    required this.title,
    required this.body,
    required this.sentTime,
    required this.priority,
    required this.relatedProject,
  });

  ParsedNotification.fromRawNotification(RawNotification rawNotification)
      : title = rawNotification.title,
        body = rawNotification.body,
        sentTime = rawNotification.sentTime,
        priority = toNotificationPriority(rawNotification.priority),
        relatedProject = rawNotification.relatedProjectId;

  final String title;
  final String body;
  final DateTime sentTime;
  final NotificationPriority priority;
  final String relatedProject;
}
