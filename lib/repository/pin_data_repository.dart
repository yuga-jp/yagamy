import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:yagamy/gen/assets.gen.dart';
import 'package:yagamy/model/pin_data/pin_data.dart';

class PinDataRepository {
  static Future<List<PinData>> fetchPinData() async {
    final response = await rootBundle.loadString(Assets.map.pinData);
    final parsedResponse = json.decode(response);
    final pinDatas = <PinData>[];

    for (var pinData in parsedResponse) {
      pinDatas.add(PinData.fromJson(pinData));
    }

    return pinDatas;
  }
}
