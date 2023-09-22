// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_situation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SaleSituation _$$_SaleSituationFromJson(Map<String, dynamic> json) =>
    _$_SaleSituation(
      id: json['id'] as String,
      saleSituation: json['saleSituation'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_SaleSituationToJson(_$_SaleSituation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'saleSituation': instance.saleSituation,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
