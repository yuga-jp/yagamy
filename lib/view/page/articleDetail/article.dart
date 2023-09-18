import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yagamy/model/home/article.dart';

class ArticleDetailBody extends StatelessWidget {
  final Article article;

  const ArticleDetailBody({super.key, required this.article});

  static const double horizontalIndent = 15;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        SliverAppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('記事詳細'),
          centerTitle: true,
          floating: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: horizontalIndent),
                    child: Text(
                      article.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Image.network(
                article.thumbnailUrl,
                width: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: horizontalIndent, right: horizontalIndent),
                child: Linkify(
                  onOpen: (link) async {
                    if (await canLaunch(link.url)) {
                      await launch(link.url);
                    } else {
                      throw 'Could not launch $link';
                    }
                  },
                  text: article.body,
                  style: const TextStyle(fontSize: 16.0),
                  linkStyle: const TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
