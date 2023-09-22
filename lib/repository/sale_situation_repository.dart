import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:yagamy/model/sale_situation/sale_situation.dart';
import 'package:yagamy/repository/base_url.dart';

class SaleSituationRepository {
  static Future<List<SaleSituation>> fetchSaleSituations() async {
    final response =
        await http.get(Uri.parse('${BaseUrl.baseUrl}/sale-situation'));

    final List<SaleSituation> saleSituations = [];

    if (response.statusCode == 200) {
      for (var saleSituation in json.decode(response.body)) {
        saleSituations.add(SaleSituation.fromJson(saleSituation));
      }
    } else {
      throw Exception('Failed to load sale situation.');
    }

    return saleSituations;
  }
}
