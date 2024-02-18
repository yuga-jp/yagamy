String getPlaceDisplaying(String area, String floor, String placeDetail) {
  String placeDisplaying = '';
  switch (area) {
    case '11':
      placeDisplaying += '11棟';
      placeDisplaying += ' $floor階';
      if (placeDetail.isNotEmpty) {
        placeDisplaying += ' $placeDetail';
      }
      break;

    case '12':
      placeDisplaying += '12棟';
      placeDisplaying += ' $floor階';
      return placeDisplaying += ' $placeDetail';

    case '14west':
      placeDisplaying += '14棟西';
      if (floor == '1') {
        placeDisplaying += ' $floor階';
      } else if (floor == 'out') {
        placeDisplaying += '周辺';
      }
      break;

    case '14east':
      placeDisplaying += '14棟東';
      if (floor == 'B2' || floor == '1') {
        placeDisplaying += ' $floor階';
      } else if (floor == 'out') {
        placeDisplaying += '周辺';
      }
      if (placeDetail.isNotEmpty) {
        placeDisplaying += ' $placeDetail';
      }
      break;

    case '16':
      return placeDisplaying += '16棟周辺';

    case '25':
      return placeDisplaying += '25棟周辺';

    case 'gym':
      return placeDisplaying += '体育館';

    case 'booth':
      return placeDisplaying += '模擬店ロード $placeDetail';

    case 'ground':
      return placeDisplaying += 'グラウンド';

    case 'miniground':
      return placeDisplaying += 'ミニグラウンド';

    case 'mainstage':
      return placeDisplaying += 'メインステージ';

    default:
      break;
  }
  return placeDisplaying;
}
