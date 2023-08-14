// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Project _$$_ProjectFromJson(Map<String, dynamic> json) => _$_Project(
      title: json['title'] as String,
      place: json['place'] as String,
      time: json['time'] as String,
      groupName: json['groupName'] as String,
      shortIntro: json['shortIntro'] as String,
      intro: json['intro'] as String,
      detailIntro: json['detailIntro'] as String,
      groupIntro: json['groupIntro'] as String,
      mainImageUrl: json['mainImageUrl'] as String,
    );

Map<String, dynamic> _$$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'title': instance.title,
      'place': instance.place,
      'time': instance.time,
      'groupName': instance.groupName,
      'shortIntro': instance.shortIntro,
      'intro': instance.intro,
      'detailIntro': instance.detailIntro,
      'groupIntro': instance.groupIntro,
      'mainImageUrl': instance.mainImageUrl,
    };
