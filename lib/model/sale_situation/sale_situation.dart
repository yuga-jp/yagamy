import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_situation.freezed.dart';
part 'sale_situation.g.dart';

@freezed
class SaleSituation with _$SaleSituation {
  const factory SaleSituation({
    required String id,
    required String saleSituation,
    required DateTime updatedAt,
  }) = _SaleSituation;

  factory SaleSituation.fromJson(Map<String, Object?> json) =>
      _$SaleSituationFromJson(json);
}
