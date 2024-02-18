import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:yagamy/model/article/article.dart';

class ArticlesRepository {
  static Future<List<Article>> fetchArticles() async {
    final response = await rootBundle.loadString('assets/article/article.json');
    final articles = <Article>[];

    for (var article in json.decode(response)) {
      articles.add(Article.fromJson(article));
    }

    return articles;
  }
}
