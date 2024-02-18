import 'package:yagamy/model/notification/raw_notification.dart';
import 'package:yagamy/model/notification_priority.dart';
import 'package:yagamy/utility/get_notification_priority.dart';

class ParsedNotification {
  ParsedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.sentTime,
    required this.priority,
    required this.relatedProjectId,
    required this.url,
    required this.urlTitle,
  });

  ParsedNotification.fromRawNotification(RawNotification rawNotification)
      : id = rawNotification.id,
        title = rawNotification.title,
        body = rawNotification.body,
        sentTime = rawNotification.sentTime.toLocal(),
        priority = getNotificationPriority(rawNotification.priority),
        relatedProjectId = rawNotification.relatedProjectId,
        url = rawNotification.url,
        urlTitle = rawNotification.urlTitle;

  final String id;
  final String title;
  final String body;
  final DateTime sentTime;
  final NotificationPriority priority;
  final String relatedProjectId;
  final String url;
  final String urlTitle;
}
