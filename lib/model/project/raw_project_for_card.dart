import 'package:freezed_annotation/freezed_annotation.dart';

part 'raw_project_for_card.freezed.dart';
part 'raw_project_for_card.g.dart';

@freezed
class RawProjectForCard with _$RawProjectForCard {
  const factory RawProjectForCard({
    required String id,
    required String title,
    required String area,
    required String floor,
    required String placeDetail,
    required DateTime? hoursStartFirstDay,
    required DateTime? hoursEndFirstday,
    required DateTime? hoursStartSecondDay,
    required DateTime? hoursEndSecondDay,
    required String groupName,
    required String thumbnailUrl,
    required String categoryMain,
    required String categorySub,
    required bool stampRally,
  }) = _RawProjectForCard;

  factory RawProjectForCard.fromJson(Map<String, Object?> json) =>
      _$RawProjectForCardFromJson(json);
}
