class PinData {
  PinData({
    required this.posX,
    required this.posY,
    required this.relatedProjectId,
  });

  PinData.fromJson(Map<String, dynamic> json)
      : posX = double.parse(json['posX']),
        posY = double.parse(json['posY']),
        relatedProjectId = json['relatedProjectId'];

  final double posX;
  final double posY;
  final String relatedProjectId;
}
