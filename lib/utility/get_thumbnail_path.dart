import 'package:yagamy/gen/assets.gen.dart';

String getThumbnailPath(String id, String thumbnailUrl) {
  if (thumbnailUrl.isNotEmpty) {
    return thumbnailUrl;
  } else {
    final filePathIter = Assets.project.thumbnail.values
        .where((element) => element.path.contains('thumbnail_$id.'));
    if (filePathIter.isNotEmpty) {
      return filePathIter.first.path;
    } else {
      return Assets.project.thumbnail.thumbnailPlaceholder.path;
    }
  }
}
