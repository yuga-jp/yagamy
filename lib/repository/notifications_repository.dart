import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/model/notification/raw_notification.dart';

class NotificationsRepository {
  static Future<List<ParsedNotification>> fetchNotifications() async {
    final response = await http.get(Uri.parse('https://'));
    final notifications = <ParsedNotification>[];

    if (response.statusCode == 200) {
      for (var notification in json.decode(response.body)) {
        notifications.add(ParsedNotification.fromRawNotification(
            RawNotification.fromJson(notification)));
      }
    } else {
      throw Exception('Failed to load notifications.');
    }

    return notifications;
  }
}
