String toPlaceString(String area, String floor, String placeDetail) {
  String placeString = '';
  switch (area) {
    case '11':
      placeString += '11棟';
      placeString += ' $floor階';
      if (placeDetail.isNotEmpty) {
        placeString += ' $placeDetail';
      }
      break;

    case '12':
      placeString += '12棟';
      placeString += ' $floor階';
      return placeString += ' $placeDetail';

    case '14west':
      placeString += '14棟西';
      if (floor == '1') {
        placeString += ' $floor階';
      } else if (floor == 'out') {
        placeString += '周辺';
      }
      break;

    case '14east':
      placeString += '14棟東';
      placeString += ' $floor';
      if (placeDetail.isNotEmpty) {
        placeString += ' $placeDetail';
      }
      break;

    case '16':
      return placeString += '16棟周辺';

    case '25':
      return placeString += '25棟周辺';

    case 'gym':
      return placeString += '体育館';

    case 'booth':
      return placeString += '模擬店ロード $placeDetail';

    case 'ground':
      return placeString += 'グラウンド';

    case 'mainstage':
      return placeString += 'メインステージ';

    default:
      break;
  }
  return placeString;
}
