import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yagamy/model/home/event_info.dart';
import 'package:yagamy/repository/base_url.dart';

class EventInfoRepository {
  static Future<EventInfo> fetchEventInfo() async {
    final res = await http.get(Uri.parse('${BaseUrl.baseUrl}/event-info'));

    if (res.statusCode == 200) {
      return EventInfo.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to load event info');
    }
  }
}
