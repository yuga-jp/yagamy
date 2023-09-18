// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventInfo _$$_EventInfoFromJson(Map<String, dynamic> json) => _$_EventInfo(
      id: json['id'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      eventType: json['eventType'] as String,
    );

Map<String, dynamic> _$$_EventInfoToJson(_$_EventInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'eventType': instance.eventType,
    };
