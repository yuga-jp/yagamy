import 'package:yagamy/model/searcher_prop.dart';

String getAreaImageFileName(SearcherProp searcherProp) {
  switch (searcherProp) {
    case SearcherProp.building11th:
      return 'eleven.jpg';
    case SearcherProp.building12thFirst:
      return 'twelve_first.jpg';
    case SearcherProp.building12thSecond:
      return 'twelve_second.jpg';
    case SearcherProp.booth:
      return 'booth.jpg';
    case SearcherProp.building14th:
      return 'fourteen.jpg';
    case SearcherProp.mainStage:
      return 'main_stage.jpg';
    case SearcherProp.eastArea:
      return 'east_area.jpg';
    case SearcherProp.ground:
      return 'ground.jpg';
    default:
      return '';
  }
}
