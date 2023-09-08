import 'package:yagamy/model/notification_priority.dart';

NotificationPriority toNotificationPriority(String priority) {
  switch (priority) {
    case '3':
      return NotificationPriority.high;
    case '2':
      return NotificationPriority.medium;
    case '1':
      return NotificationPriority.low;
    default:
      return NotificationPriority.low;
  }
}
