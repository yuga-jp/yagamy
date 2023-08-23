import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    required int id,
    required String title,
    required String place,
    required String time,
    required String groupName,
    required String shortIntro,
    required String intro,
    required String introExtension,
    required String groupIntro,
    required String thumbnailUrl,
    required String mainImageUrl,
    required String twitterId,
    required String instagramId,
    required String homepageUrl,
  }) = _Project;

  factory Project.fromJson(Map<String, Object?> json) =>
      _$ProjectFromJson(json);
}
