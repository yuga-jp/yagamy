import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/gen/assets.gen.dart';
import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/model/notification/raw_notification.dart';
import 'package:yagamy/storage/notifications_storage.dart';

final notificationsProvider =
    FutureProvider<List<ParsedNotification>>((ref) async {
  final initialNotifications = json.decode(
    await rootBundle.loadString(Assets.json.notificationsInitial),
  );

  final notifications = <ParsedNotification>[];

  for (var notification in initialNotifications) {
    notifications.add(ParsedNotification.fromRawNotification(
        RawNotification.fromJson(notification)));
  }

  final cachedNotifications = await NotificationsStorage.readNotifications();

  for (var notification in cachedNotifications) {
    notifications.add(notification);
  }

  return notifications;
});
