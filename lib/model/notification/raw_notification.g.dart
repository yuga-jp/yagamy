// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RawNotification _$$_RawNotificationFromJson(Map<String, dynamic> json) =>
    _$_RawNotification(
      title: json['title'] as String,
      body: json['body'] as String,
      sentTime: DateTime.parse(json['sentTime'] as String),
      priority: json['priority'] as String,
      relatedProjectId: json['relatedProjectId'] as String,
    );

Map<String, dynamic> _$$_RawNotificationToJson(_$_RawNotification instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'sentTime': instance.sentTime.toIso8601String(),
      'priority': instance.priority,
      'relatedProjectId': instance.relatedProjectId,
    };
