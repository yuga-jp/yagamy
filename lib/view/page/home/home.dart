import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:yagamy/gen/assets.gen.dart';
import 'package:yagamy/model/event_type.dart';
import 'package:yagamy/view/page/home/ui_part/article_list.dart';
import 'package:yagamy/view/page/home/ui_part/event_information_card.dart';
import 'package:yagamy/view/page/home/ui_part/top_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
      slivers: <Widget>[
        SliverAppBar(
          title: SvgPicture.asset(
            Assets.logo.yagamiFestival2023.path,
            width: 100,
            height: 40,
          ),
          // actions: const <Widget>[
          //   Icon(Icons.account_circle_outlined),
          //   SizedBox(width: 15),
          // ],
          centerTitle: false,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const EventInformationCard(eventType: EventType.normal),
              SizedBox(
                height: 250,
                child: PageView(
                  children: const [
                    TopCard(),
                  ],
                ),
              )
            ],
          ),
        ),
        const ArticleList(),
      ],
    );
  }
}
