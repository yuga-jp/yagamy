import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yagamy/model/article/article.dart';
import 'package:yagamy/provider/articles_provider.dart';
import 'package:yagamy/view/page/home/ui_part/article_card.dart';

class ArticleList extends ConsumerStatefulWidget {
  const ArticleList({super.key});

  @override
  ConsumerState<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends ConsumerState<ArticleList> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Article>> articles = ref.watch(articlesProvider);

    return articles.when(
      loading: () {
        return SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.center,
            height: 40,
            margin: const EdgeInsets.only(top: 15),
            child: const CircularProgressIndicator.adaptive(),
          ),
        );
      },
      error: (error, stackTrace) {
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
      data: (articles) {
        return SliverPadding(
          padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
          sliver: SliverGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            childAspectRatio: 1.1,
            children: <Widget>[
              for (var article in articles) ArticleCard(article: article),
            ],
          ),
        );
      },
    );
  }
}
