import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yagamy/model/article/article.dart';
import 'package:yagamy/provider/articles_provider.dart';

final articleProvider =
    FutureProvider.autoDispose.family<Article, String>((ref, id) async {
  final articles = ref.watch(articlesProvider);

  return articles.maybeWhen(
    orElse: () {
      throw Exception();
    },
    data: (articles) {
      return articles.where((article) => article.id == id).first;
    },
  );
});
