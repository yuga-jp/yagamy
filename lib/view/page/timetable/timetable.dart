import 'package:flutter/material.dart';

import 'package:yagamy/model/timetable_searcher_type.dart';
import 'package:yagamy/view/common/ui_part/switch_button/slide_button.dart';
import 'package:yagamy/view/page/timetable/ui_part/nested_tabbar.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({Key? key}) : super(key: key);

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late final TabController _nestedTabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _nestedTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nestedTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomScrollView(
        physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: Column(
                children: <Widget>[
                  TabBar(
                    controller: _tabController,
                    isScrollable: false,
                    tabs: const <Widget>[
                      Tab(text: '1日目'),
                      Tab(text: '2日目'),
                    ],
                  ),
                  const SlideButton(
                    leftText: 'メインステージ',
                    rightText: '14棟ホール',
                    width: 320,
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox.shrink(
              child: TabBarView(
                controller: _tabController,
                children: const <Widget>[
                  NestedTabBar(TimetableSearcherTypeDay.firstDay),
                  NestedTabBar(TimetableSearcherTypeDay.secondDay),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
