import 'package:yagamy/model/searcher_prop.dart';

List<SearcherProp> toSearcherPropList(
    String categoryMain, String categorySub, String area, String floor) {
  List<SearcherProp> propList = [];
  SearcherProp? propCategoryMain = toSearcherPropCategory(categoryMain);
  SearcherProp? propCategorySub = toSearcherPropCategory(categorySub);
  SearcherProp propPlace = toSearcherPropPlace(area, floor);
  if (propCategoryMain != null) {
    propList.add(propCategoryMain);
  }
  if (propCategorySub != null) {
    propList.add(propCategorySub);
  }
  propList.add(propPlace);
  return propList;
}

SearcherProp? toSearcherPropCategory(String value) {
  SearcherProp? searcherProp;
  switch (value) {
    case 'exhibiton':
      searcherProp = SearcherProp.exhibiton;
      break;
    case 'experience':
      searcherProp = SearcherProp.experience;
      break;
    case 'activity':
      searcherProp = SearcherProp.activity;
      break;
    case 'science':
      searcherProp = SearcherProp.science;
      break;
    case 'performance':
      searcherProp = SearcherProp.performance;
      break;
    case 'liveTalk':
      searcherProp = SearcherProp.liveTalk;
      break;
    case 'watching':
      searcherProp = SearcherProp.watching;
      break;
    case 'goodsSelling':
      searcherProp = SearcherProp.goodsSelling;
      break;
    case 'foodsSelling':
      searcherProp = SearcherProp.foodsSelling;
      break;
    case 'information':
      searcherProp = SearcherProp.information;
      break;
    case '':
      searcherProp = null;
  }
  return searcherProp;
}

SearcherProp toSearcherPropPlace(String area, String floor) {
  SearcherProp searcherProp = SearcherProp.initial;
  switch (area) {
    case '11':
      searcherProp = SearcherProp.building11th;
      break;
    case '12':
      if (floor == '1') {
        searcherProp = SearcherProp.building12thFirst;
      }
      if (floor == '2') {
        searcherProp = SearcherProp.building12thSecond;
      }
      break;
    case '14west':
      searcherProp = SearcherProp.building14th;
      break;
    case '14east':
      searcherProp = SearcherProp.building14th;
      break;
    case '16':
      searcherProp = SearcherProp.eastArea;
      break;
    case '25':
      searcherProp = SearcherProp.eastArea;
      break;
    case 'gym':
      searcherProp = SearcherProp.eastArea;
      break;
    case 'booth':
      searcherProp = SearcherProp.booth;
      break;
    case 'ground':
      searcherProp = SearcherProp.ground;
      break;
    case 'mainstage':
      searcherProp = SearcherProp.mainStage;
      break;
  }
  return searcherProp;
}
