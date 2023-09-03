import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/gen/assets.gen.dart';
import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/model/notification/raw_notification.dart';

final notificationsProvider =
    FutureProvider<List<ParsedNotification>>((ref) async {
  final content = json.decode(
    await rootBundle.loadString(Assets.json.notifications),
  );

  final notifications = <ParsedNotification>[];

  for (var notification in content) {
    notifications.add(ParsedNotification.fromRawNotification(
        RawNotification.fromJson(notification)));
  }

  return notifications;
});
