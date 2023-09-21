import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:yagamy/model/article/article.dart';
import 'package:yagamy/repository/base_url.dart';

class ArticlesRepository {
  static Future<List<Article>> fetchArticles() async {
    final response = await http.get(Uri.parse('${BaseUrl.baseUrl}/article/'));

    final articles = <Article>[];

    if (response.statusCode == 200) {
      for (var article in json.decode(response.body)) {
        articles.add(Article.fromJson(article));
      }
    } else {
      throw Exception('Failed to load articles.');
    }

    return articles;
  }
}