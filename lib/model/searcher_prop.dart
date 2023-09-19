import 'package:yagamy/model/searcher_type.dart';

enum SearcherProp {
  initial(name: '', type: SearcherType.initial),

  exhibiton(name: '展示', type: SearcherType.categories),
  experience(name: '体験型', type: SearcherType.categories),
  activity(name: 'アクティビティ', type: SearcherType.categories),
  science(name: 'サイエンス', type: SearcherType.categories),
  performance(name: 'パフォーマンス', type: SearcherType.categories),
  liveTalk(name: 'トークライブ', type: SearcherType.categories),
  watching(name: '観戦', type: SearcherType.categories),
  goodsSelling(name: '物品販売', type: SearcherType.categories),
  foodsSelling(name: '食品販売', type: SearcherType.categories),
  information(name: '情報提供', type: SearcherType.categories),

  building11th(name: '11棟', type: SearcherType.places),
  building12thFirst(name: '12棟1階', type: SearcherType.places),
  building12thSecond(name: '12棟2階', type: SearcherType.places),
  booth(name: '模擬店ロード', type: SearcherType.places),
  building14th(name: '14棟', type: SearcherType.places),
  mainStage(name: 'メインステージ', type: SearcherType.places),
  eastArea(name: '東側エリア', type: SearcherType.places),
  ground(name: 'グラウンド', type: SearcherType.places);

  const SearcherProp({required this.name, required this.type});

  final String name;
  final SearcherType type;

  bool isCategoryProp() {
    return type == SearcherType.categories;
  }

  bool isPlaceProp() {
    return type == SearcherType.places;
  }
}
