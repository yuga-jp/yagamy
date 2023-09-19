// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RawProject _$$_RawProjectFromJson(Map<String, dynamic> json) =>
    _$_RawProject(
      id: json['id'] as String,
      title: json['title'] as String,
      area: json['area'] as String,
      floor: json['floor'] as String,
      placeDetail: json['placeDetail'] as String,
      hoursStartFirstDay: json['hoursStartFirstDay'] == null
          ? null
          : DateTime.parse(json['hoursStartFirstDay'] as String),
      hoursEndFirstDay: json['hoursEndFirstDay'] == null
          ? null
          : DateTime.parse(json['hoursEndFirstDay'] as String),
      hoursStartSecondDay: json['hoursStartSecondDay'] == null
          ? null
          : DateTime.parse(json['hoursStartSecondDay'] as String),
      hoursEndSecondDay: json['hoursEndSecondDay'] == null
          ? null
          : DateTime.parse(json['hoursEndSecondDay'] as String),
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
      categoryMain: json['categoryMain'] as String,
      categorySub: json['categorySub'] as String,
      stampRally: json['stampRally'] as bool,
    );

Map<String, dynamic> _$$_RawProjectToJson(_$_RawProject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'area': instance.area,
      'floor': instance.floor,
      'placeDetail': instance.placeDetail,
      'hoursStartFirstDay': instance.hoursStartFirstDay?.toIso8601String(),
      'hoursEndFirstDay': instance.hoursEndFirstDay?.toIso8601String(),
      'hoursStartSecondDay': instance.hoursStartSecondDay?.toIso8601String(),
      'hoursEndSecondDay': instance.hoursEndSecondDay?.toIso8601String(),
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
      'categoryMain': instance.categoryMain,
      'categorySub': instance.categorySub,
      'stampRally': instance.stampRally,
    };
