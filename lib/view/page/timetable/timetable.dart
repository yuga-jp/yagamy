import 'package:flutter/material.dart';

import 'package:yagamy/model/timetable_searcher_type.dart';
import 'package:yagamy/view/common/ui_part/slide_button/slide_button.dart';
import 'package:yagamy/view/page/timetable/ui_part/performance_card.dart';
import 'package:yagamy/view/page/timetable/ui_part/performance_list.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({Key? key}) : super(key: key);

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  static const double _tabSpace = 55;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      //NestedScrollview
      child: NestedScrollView(
        physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabs: const <Widget>[
                    Tab(
                      child: Row(children: [
                        SizedBox(width: _tabSpace),
                        Text('1日目'),
                        SizedBox(width: _tabSpace)
                      ]),
                    ),
                    Tab(
                      child: Row(children: [
                        SizedBox(width: _tabSpace),
                        Text('2日目'),
                        SizedBox(width: _tabSpace)
                      ]),
                    ),
                  ],
                ),
              ),
            )
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            Builder(
              builder: (BuildContext context) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    const SliverToBoxAdapter(
                      child: SlideButton(
                        leftText: 'メインステージ',
                        rightText: '14棟ホール',
                        width: 320,
                        height: 30,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return const PerformanceCard(
                            title: 'title',
                            imageUrl: 'https://picsum.photos/500/500',
                            time: '10:00-10:30',
                          );
                        },
                        childCount: 3,
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
