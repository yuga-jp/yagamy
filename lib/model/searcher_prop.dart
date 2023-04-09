import 'package:yagamy/model/searcher_type.dart';

enum SearcherProp {
  initial(name: '', type: SearcherType.initial),
  activity(name: 'アクティビティ', type: SearcherType.categories),
  experience(name: '体験型', type: SearcherType.categories),
  science(name: 'サイエンス', type: SearcherType.categories),
  exhibiton(name: '展示', type: SearcherType.categories),
  performance(name: 'パフォーマンス', type: SearcherType.categories),
  liveTalk(name: 'トークライブ', type: SearcherType.categories),
  booth(name: '模擬店', type: SearcherType.categories),
  goodsSelling(name: '物品販売', type: SearcherType.categories),
  information(name: '情報提供', type: SearcherType.categories),
  otherCategories(name: 'その他', type: SearcherType.categories),
  building11th(name: '11棟', type: SearcherType.places),
  building12th(name: '12棟', type: SearcherType.places),
  building14th(name: '14棟', type: SearcherType.places),
  building16th(name: '16棟', type: SearcherType.places),
  street(name: 'ストリート', type: SearcherType.places),
  ground(name: 'グラウンド', type: SearcherType.places),
  gym(name: '体育館', type: SearcherType.places),
  mainStage(name: 'メインステージ', type: SearcherType.places),
  otherPlaces(name: 'その他', type: SearcherType.places);

  const SearcherProp({required this.name, required this.type});

  final String name;
  final SearcherType type;
}
