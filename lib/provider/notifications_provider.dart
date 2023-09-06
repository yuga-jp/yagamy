import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/repository/notifications_repository.dart';

final notificationsProvider =
    FutureProvider<List<ParsedNotification>>((ref) async {
  return NotificationsRepository.fetchNotifications();
});
