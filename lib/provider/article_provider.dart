import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:yagamy/model/home/article.dart';
import 'package:yagamy/repository/base_url.dart';

final articleProvider = FutureProvider<List<Article>>((ref) async {
  final response = await http.get(Uri.parse('${BaseUrl.baseUrl}/article'));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as List;
    return json.map((e) => Article.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load articles');
  }
});
