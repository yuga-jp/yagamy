// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RawNotificationImpl _$$RawNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$RawNotificationImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      sentTime: DateTime.parse(json['sentTime'] as String),
      priority: json['priority'] as String,
      relatedProjectId: json['relatedProjectId'] as String,
      url: json['url'] as String,
      urlTitle: json['urlTitle'] as String,
    );

Map<String, dynamic> _$$RawNotificationImplToJson(
        _$RawNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'sentTime': instance.sentTime.toIso8601String(),
      'priority': instance.priority,
      'relatedProjectId': instance.relatedProjectId,
      'url': instance.url,
      'urlTitle': instance.urlTitle,
    };
