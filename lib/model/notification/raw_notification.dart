import 'package:freezed_annotation/freezed_annotation.dart';

part 'raw_notification.freezed.dart';
part 'raw_notification.g.dart';

@freezed
class RawNotification with _$RawNotification {
  const factory RawNotification({
    required String id,
    required String title,
    required String body,
    required DateTime sentTime,
    required String priority,
    required String relatedProjectId,
  }) = _RawNotification;

  factory RawNotification.fromJson(Map<String, Object?> json) =>
      _$RawNotificationFromJson(json);
}
