import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/model/notification/raw_notification.dart';
import 'package:yagamy/repository/base_url.dart';

class NotificationsRepository {
  static Future<List<ParsedNotification>> fetchNotifications() async {
    final response =
        await http.get(Uri.parse('${BaseUrl.baseUrl}/notifications/'));

    final notifications = <ParsedNotification>[];

    if (response.statusCode == 200) {
      for (var notification in json.decode(response.body)) {
        notifications.add(
            ParsedNotification.fromRawNotification(RawNotification.fromJson({
          'id': notification['id'],
          'title': notification['title'],
          'body': notification['body'],
          'sentTime': notification['createdAt'],
          'priority': notification['priority'],
          'relatedProjectId': notification['relatedProjectId'],
          'url': notification['url'],
        })));
      }
    } else {
      throw Exception('Failed to load notifications.');
    }

    return notifications..sort((a, b) {
      return b.sentTime.compareTo(a.sentTime);
    });
  }
}
