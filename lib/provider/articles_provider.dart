import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yagamy/model/article/article.dart';
import 'package:yagamy/repository/articles_repository.dart';

final articlesProvider = FutureProvider<List<Article>>((ref) async {
  return ArticlesRepository.fetchArticles();
});
