// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_project_for_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RawProjectForCard _$$_RawProjectForCardFromJson(Map<String, dynamic> json) =>
    _$_RawProjectForCard(
      id: json['id'] as String,
      title: json['title'] as String,
      area: json['area'] as String,
      floor: json['floor'] as String,
      placeDetail: json['placeDetail'] as String,
      hoursStartFirstDay: json['hoursStartFirstDay'] == null
          ? null
          : DateTime.parse(json['hoursStartFirstDay'] as String),
      hoursEndFirstday: json['hoursEndFirstday'] == null
          ? null
          : DateTime.parse(json['hoursEndFirstday'] as String),
      hoursStartSecondDay: json['hoursStartSecondDay'] == null
          ? null
          : DateTime.parse(json['hoursStartSecondDay'] as String),
      hoursEndSecondDay: json['hoursEndSecondDay'] == null
          ? null
          : DateTime.parse(json['hoursEndSecondDay'] as String),
      groupName: json['groupName'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      categoryMain: json['categoryMain'] as String,
      categorySub: json['categorySub'] as String,
      stampRally: json['stampRally'] as bool,
    );

Map<String, dynamic> _$$_RawProjectForCardToJson(
        _$_RawProjectForCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'area': instance.area,
      'floor': instance.floor,
      'placeDetail': instance.placeDetail,
      'hoursStartFirstDay': instance.hoursStartFirstDay?.toIso8601String(),
      'hoursEndFirstday': instance.hoursEndFirstday?.toIso8601String(),
      'hoursStartSecondDay': instance.hoursStartSecondDay?.toIso8601String(),
      'hoursEndSecondDay': instance.hoursEndSecondDay?.toIso8601String(),
      'groupName': instance.groupName,
      'thumbnailUrl': instance.thumbnailUrl,
      'categoryMain': instance.categoryMain,
      'categorySub': instance.categorySub,
      'stampRally': instance.stampRally,
    };
