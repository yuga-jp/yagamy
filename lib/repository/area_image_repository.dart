import 'package:yagamy/model/map_type.dart';
import 'package:yagamy/model/searcher_prop.dart';
import 'package:yagamy/utility/get_area_image_file_name.dart';

class AreaImageRepository {
  static String getAreaImagePath({
    SearcherProp? searcherProp,
    MapType? mapType,
  }) {
    if (searcherProp == null && mapType == null) {
      throw Exception();
    } else if (searcherProp != null) {
      return 'assets/project/area_image/${getAreaImageFileNameBySearcherProp(searcherProp)}';
    } else if (mapType != null) {
      return 'assets/project/area_image/${getAreaImageFileNameByMapType(mapType)}';
    } else {
      throw Exception();
    }
  }
}
