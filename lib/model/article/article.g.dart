// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      url: json['url'] as String,
      urlTitle: json['urlTitle'] as String?,
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'thumbnailUrl': instance.thumbnailUrl,
      'url': instance.url,
      'urlTitle': instance.urlTitle,
    };
