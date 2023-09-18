import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:yagamy/model/map_type.dart';
import 'package:yagamy/model/pin_data/pin_data.dart';
import 'package:yagamy/utility/map_type_to_path.dart';

class PinDataRepository {
  static Future<List<PinData>> fetchPinData(MapType mapType) async {
    final response = await rootBundle.loadString(mapPinDataPath(mapType));
    final parsedResponse = json.decode(response);
    final pinDatas = <PinData>[];

    for (var pinData in parsedResponse) {
      pinDatas.add(PinData.fromJson(pinData));
    }

    return pinDatas;
  }
}
