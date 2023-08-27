import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'raw_project.freezed.dart';
part 'raw_project.g.dart';

@freezed
class RawProject with _$RawProject {
  const factory RawProject({
    required int id,
    required String title,
    required String area,
    required String floor,
    required String placeDetail,
    required String hoursFirstDay,
    required String hoursSecondDay,
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
    required String categoryMain,
    required String categorySub,
  }) = _RawProject;

  factory RawProject.fromJson(Map<String, Object?> json) =>
      _$RawProjectFromJson(json);
}
