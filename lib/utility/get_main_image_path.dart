import 'package:yagamy/gen/assets.gen.dart';

String getMainImagePath(String id, String mainImageUrl) {
  if (mainImageUrl.isNotEmpty) {
    return mainImageUrl;
  } else {
    final filePathIter = Assets.project.mainImage.values
        .where((element) => element.path.contains('main_image_$id.'));
    if (filePathIter.isNotEmpty) {
      return filePathIter.first.path;
    } else {
      return Assets.project.mainImage.mainImagePlaceholder.path;
    }
  }
}
