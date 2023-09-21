import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:yagamy/model/advertisement/advertisement.dart';
import 'package:yagamy/repository/base_url.dart';

class AdvertisementsRepository {
  static Future<List<Advertisement>> fetchAdvertisements() async {
    final response =
        await http.get(Uri.parse('${BaseUrl.baseUrl}/advertisements/'));
    final ads = <Advertisement>[];

    if (response.statusCode == 200) {
      for (var ad in json.decode(response.body)) {
        ads.add(Advertisement.fromJson(ad));
      }
    } else {
      throw Exception('Failed to load advertisements.');
    }

    return ads;
  }
}
