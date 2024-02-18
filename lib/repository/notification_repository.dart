import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/model/notification/raw_notification.dart';

class NotificationRepository {
  static Future<ParsedNotification> fetchNotification(String id) async {
    final response =
        await rootBundle.loadString('assets/notification/notification.json');

    for (var data in json.decode(response)) {
      final rawNotification = RawNotification.fromJson(data);
      if (rawNotification.id == id) {
        return ParsedNotification.fromRawNotification(rawNotification);
      }
    }
    throw Exception('Failed to load notification(notificationID:$id)');
  }
}
