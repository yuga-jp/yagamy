import 'package:yagamy/model/notification_priority.dart';

extension NotificationPriorityExtension on NotificationPriority {
  String priorityToString() {
    switch (this) {
      case NotificationPriority.high:
        return '3';
      case NotificationPriority.medium:
        return '2';
      case NotificationPriority.low:
        return '1';
    }
  }
}
