// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_situation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SaleSituationImpl _$$SaleSituationImplFromJson(Map<String, dynamic> json) =>
    _$SaleSituationImpl(
      id: json['id'] as String,
      saleSituation: json['saleSituation'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SaleSituationImplToJson(_$SaleSituationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'saleSituation': instance.saleSituation,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
