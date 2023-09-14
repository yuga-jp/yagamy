import 'dart:ui';

import 'package:yagamy/model/pin_data/pin_point.dart';

enum PinType {
  headquarter(name: '矢上祭本部', pinPoint: PinPoint.center, size: Size.square(30)),
  informationCenter(
      name: '総合案内所', pinPoint: PinPoint.center, size: Size.square(30)),
  boothHeadquarter(
      name: '模擬店本部', pinPoint: PinPoint.center, size: Size.square(30)),
  outdoorRestArea(
      name: '屋外休憩所', pinPoint: PinPoint.center, size: Size.square(30)),
  publicPhone(name: '公衆電話', pinPoint: PinPoint.center, size: Size.square(30)),
  securityOffice(name: '警備室', pinPoint: PinPoint.center, size: Size.square(30)),
  trashCan(name: 'ゴミ箱', pinPoint: PinPoint.center, size: Size.square(30)),
  aed(name: 'AED', pinPoint: PinPoint.center, size: Size.square(30)),
  elevator(name: 'エレベーター', pinPoint: PinPoint.center, size: Size.square(30)),
  restroom(name: 'お手洗い', pinPoint: PinPoint.center, size: Size.square(30)),
  restroomMen(
      name: '男性用お手洗い', pinPoint: PinPoint.center, size: Size.square(30)),
  restroomWomen(
      name: '女性用お手洗い', pinPoint: PinPoint.center, size: Size.square(30)),
  project(
      name: '', pinPoint: PinPoint.bottomCenter, size: Size(50, 50 * 1.2)),
  text(name: '', pinPoint: PinPoint.center, size: Size.square(30)),
  defaultPin(name: '', pinPoint: PinPoint.bottomCenter, size: Size.square(30));

  const PinType({
    required this.name,
    required this.pinPoint,
    required this.size,
  });

  final String name;
  final PinPoint pinPoint;
  final Size size;
}
