import 'package:freezed_annotation/freezed_annotation.dart';

part 'advertisement.freezed.dart';
part 'advertisement.g.dart';

@freezed
class Advertisement with _$Advertisement {
  const factory Advertisement({
    required String id,
    required String title,
    required String text,
    required String url,
  }) = _Advertisement;

  factory Advertisement.fromJson(Map<String, Object?> json) =>
      _$AdvertisementFromJson(json);
}
