import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yagamy/gen/assets.gen.dart';
import 'package:yagamy/model/event_type.dart';
import 'package:yagamy/model/home/article.dart';
import 'package:yagamy/provider/article_provider.dart';
import 'package:yagamy/view/page/articleDetail/article.dart';
import 'package:yagamy/view/page/home/ui_part/event_information_card.dart';
import 'package:yagamy/view/page/home/ui_part/top_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Article>> articles = ref.watch(articleProvider);
    return CustomScrollView(
      physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
      slivers: <Widget>[
        SliverAppBar(
          title: SvgPicture.asset(
            Assets.logo.yagamiFestival2023.path,
            width: 100,
            height: 40,
          ),
          actions: const <Widget>[
            Icon(Icons.account_circle_outlined),
            SizedBox(width: 15),
          ],
          centerTitle: false,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const EventInformationCard(eventType: EventType.normal),
              SizedBox(
                height: 250,
                //width: 300,
                child: PageView(
                  children: const [
                    TopCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 2,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return articles.when(
                data: (articlesData) {
                  Article article = articlesData[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ArticleDetailBody(article: article),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              child: Image.network(
                                article.thumbnailUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              article.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (e, st) => const Text('An error occurred'),
              );
            },
            childCount: articles.when(
              data: (articlesData) => articlesData.length,
              loading: () => 0,
              error: (e, st) => 0,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
