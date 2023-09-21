import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:yagamy/model/article/article.dart';
import 'package:yagamy/provider/article_provider.dart';

class ArticleDetailPage extends ConsumerWidget {
  const ArticleDetailPage(this.id, {super.key});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Article> article = ref.watch(articleProvider(id));

    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: article.when(
              loading: () {
                return const SizedBox();
              },
              error: (error, stackTrace) {
                return const SizedBox();
              },
              data: (article) {
                return CachedNetworkImage(imageUrl: article.thumbnailUrl);
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.06,
            left: MediaQuery.of(context).size.width * 0.06,
            child: Material(
              elevation: 2.0,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: Container(
                color: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.9,
            child: Container(
              padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: article.when(
                loading: () {
                  return const SizedBox();
                },
                error: (error, stackTrace) {
                  return const SizedBox();
                },
                data: (article) {
                  return Column(
                    children: [
                      Text(
                        article.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(article.body),
                      article.url.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: IconButton(
                                icon: const Icon(Icons.web),
                                onPressed: () {
                                  launchUrl(Uri.parse(article.url));
                                },
                                iconSize: 28,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
