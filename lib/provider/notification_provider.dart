import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/provider/notifications_provider.dart';

final notificationProvider =
    FutureProvider.autoDispose.family<ParsedNotification, String>(
  (ref, id) async {
    if
    final notifications = ref.watch(notificationsProvider);
    return notifications.maybeWhen(
      orElse: () {
        return ParsedNotification.empty();
      },
      data: (notifications) {
        return notifications
            .where((notification) => id == notification.id)
            .first;
      },
    );
  },
);
