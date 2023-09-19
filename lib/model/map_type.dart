enum MapType {
  wholeArea(displayName: '全体マップ'),
  eleven(
    displayName: '11棟',
    floorTypes: [
      FloorType.secondFloor,
      FloorType.firstFloor,
      FloorType.firstBasement,
      FloorType.secondBasement,
    ],
  ),
  twelve(
    displayName: '12棟',
    floorTypes: [FloorType.secondFloor, FloorType.firstFloor],
  ),
  fourteen(displayName: '14棟'),
  eastAreaGround(displayName: '東側エリア\nグラウンド');

  const MapType({
    required this.displayName,
    this.floorTypes,
  });

  final String displayName;
  final List<FloorType>? floorTypes;
}

enum FloorType {
  secondBasement(displayName: 'B2'),
  firstBasement(displayName: 'B1'),
  firstFloor(displayName: '1'),
  secondFloor(displayName: '2');

  const FloorType({required this.displayName});

  final String displayName;
}
