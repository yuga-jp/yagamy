enum MapType {
  wholeArea(displayName: '全体マップ'),
  eleven1floor(displayName: ''),
  eleven2floor(displayName: ''),
  eleven3floor(displayName: '11棟'),
  eleven4floor(displayName: ''),
  twelve1floor(displayName: '12棟'),
  twelve2floor(displayName: ''),
  fourteen(displayName: '14棟'),
  eastAreaGround(displayName: '東側エリア\nグラウンド');

  const MapType({required this.displayName});
  
  final String displayName;
}
