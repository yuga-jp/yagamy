import 'package:yagamy/model/map_type.dart';
import 'package:yagamy/model/searcher_prop.dart';
import 'package:yagamy/repository/base_url.dart';

String getImageUrlEnd(SearcherProp? searcherProp, MapType? mapType) {
  if (searcherProp == null) {
    switch (mapType!) {
      case MapType.wholeArea:
        return ImagePathEnd.wholeArea;
      case MapType.eleven:
        return ImagePathEnd.eleven;
      case MapType.twelve:
        return ImagePathEnd.twelveFirst;
      case MapType.fourteen:
        return ImagePathEnd.fourteen;
      case MapType.eastAreaGround:
        return ImagePathEnd.ground;
    }
  } else {
    switch (searcherProp) {
      case SearcherProp.building11th:
        return ImagePathEnd.eleven;
      case SearcherProp.building12thFirst:
        return ImagePathEnd.twelveFirst;
      case SearcherProp.building12thSecond:
        return ImagePathEnd.twelveSecond;
      case SearcherProp.booth:
        return ImagePathEnd.booth;
      case SearcherProp.building14th:
        return ImagePathEnd.fourteen;
      case SearcherProp.mainStage:
        return ImagePathEnd.mainStage;
      case SearcherProp.eastArea:
        return ImagePathEnd.eastArea;
      case SearcherProp.ground:
        return ImagePathEnd.ground;
      default:
        return ImagePathEnd.wholeArea;
    }
  }
}
