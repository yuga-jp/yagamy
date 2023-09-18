import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_info.freezed.dart';
part 'event_info.g.dart';

@freezed
class EventInfo with _$EventInfo {
  const factory EventInfo(
      {required String id,
      required DateTime updatedAt,
      required String eventType}) = _EventInfo;

  factory EventInfo.fromJson(Map<String, dynamic> json) =>
      _$EventInfoFromJson(json);
}
