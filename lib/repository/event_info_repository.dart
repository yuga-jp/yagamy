import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:yagamy/model/event_info/event_info.dart';

class EventInfoRepository {
  static Future<EventInfo> fetchEventInfo() async {
    final response =
        await rootBundle.loadString('assets/event_info/event_info.json');

    return EventInfo.fromJson(json.decode(response));
  }
}
