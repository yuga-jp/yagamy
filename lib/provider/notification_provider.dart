import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/repository/notification_repository.dart';

final notificationProvider = FutureProvider.autoDispose
    .family<ParsedNotification, String>((ref, id) async {
  return NotificationRepository.fetchNotification(id);
});
