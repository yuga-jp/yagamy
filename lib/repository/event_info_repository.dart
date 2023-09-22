import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:yagamy/model/event_info/event_info.dart';
import 'package:yagamy/repository/base_url.dart';

class EventInfoRepository {
  static Future<EventInfo> fetchEventInfo() async {
    final response = await http.get(Uri.parse('${BaseUrl.baseUrl}/event-info'));

    if (response.statusCode == 200) {
      return EventInfo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load articles.');
    }
  }
}
