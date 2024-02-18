import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/model/notification/raw_notification.dart';

class NotificationsRepository {
  static Future<List<ParsedNotification>> fetchNotifications() async {
    final response =
        await rootBundle.loadString('assets/notification/notification.json');

    final notifications = <ParsedNotification>[];

    for (var notification in json.decode(response)) {
      notifications.add(ParsedNotification.fromRawNotification(
          RawNotification.fromJson(notification)));
    }

    return notifications
      ..sort((a, b) {
        return b.sentTime.compareTo(a.sentTime);
      });
  }
}
