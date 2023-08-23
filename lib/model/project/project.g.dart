// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Project _$$_ProjectFromJson(Map<String, dynamic> json) => _$_Project(
      id: json['id'] as int,
      title: json['title'] as String,
      place: json['place'] as String,
      time: json['time'] as String,
      groupName: json['groupName'] as String,
      shortIntro: json['shortIntro'] as String,
      intro: json['intro'] as String,
      introExtension: json['introExtension'] as String,
      groupIntro: json['groupIntro'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      mainImageUrl: json['mainImageUrl'] as String,
      twitterId: json['twitterId'] as String,
      instagramId: json['instagramId'] as String,
      homepageUrl: json['homepageUrl'] as String,
    );

Map<String, dynamic> _$$_ProjectToJson(_$_Project instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'place': instance.place,
      'time': instance.time,
      'groupName': instance.groupName,
      'shortIntro': instance.shortIntro,
      'intro': instance.intro,
      'introExtension': instance.introExtension,
      'groupIntro': instance.groupIntro,
      'thumbnailUrl': instance.thumbnailUrl,
      'mainImageUrl': instance.mainImageUrl,
      'twitterId': instance.twitterId,
      'instagramId': instance.instagramId,
      'homepageUrl': instance.homepageUrl,
    };
