import 'package:yagamy/extension/notification_priority_extension.dart';
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
        sentTime = rawNotification.sentTime,
        priority = toNotificationPriority(rawNotification.priority),
        relatedProjectId = rawNotification.relatedProjectId;

  final String id;
  final String title;
  final String body;
  final DateTime sentTime;
  final NotificationPriority priority;
  final String relatedProjectId;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'sentTime': sentTime.toString(),
      'priority': priority.priorityToString(),
      'relatedProjectId': relatedProjectId,
    };
  }
}
