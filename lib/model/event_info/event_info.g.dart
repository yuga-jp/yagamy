// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventInfoImpl _$$EventInfoImplFromJson(Map<String, dynamic> json) =>
    _$EventInfoImpl(
      id: json['id'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      eventType: json['eventType'] as String,
    );

Map<String, dynamic> _$$EventInfoImplToJson(_$EventInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'eventType': instance.eventType,
    };
