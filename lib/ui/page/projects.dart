import 'package:flutter/material.dart';
import 'package:yagamy/model/search_button_prop.dart';

import 'package:yagamy/ui/widget/card/project_card.dart';
import 'package:yagamy/ui/widget/button/search_button.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
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
    return Center(
      child: CustomScrollView(
        physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          const SliverAppBar(
            actions: <Widget>[
              Icon(Icons.search),
              SizedBox(width: 15),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: SearchButtonBar(),
            ),
            floating: true,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const ProjectCard(
                  title: "Quiz30問！",
                  groupName: "慶應Quiz研究会",
                  imageUrl: "https://picsum.photos/300/300",
                  placeName: "14棟-101教室",
                  time: "10:00-15:00",
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchButtonBar extends StatefulWidget {
  const SearchButtonBar({Key? key}) : super(key: key);

  @override
  State<SearchButtonBar> createState() => _SearchButtonBarState();
}

class _SearchButtonBarState extends State<SearchButtonBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<SearchButtonProp> categories = const [
    SearchButtonProp('アクティビティ'),
    SearchButtonProp('物品販売'),
    SearchButtonProp('パフォーマンス'),
    SearchButtonProp('コンサート'),
    SearchButtonProp('食品販売'),
  ];

  List<SearchButtonProp> places = const [
    SearchButtonProp('11棟'),
    SearchButtonProp('12棟'),
    SearchButtonProp('13棟'),
    SearchButtonProp('14棟'),
    SearchButtonProp('21棟'),
    SearchButtonProp('グラウンド'),
    SearchButtonProp('縁日'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SingleSearchButtonBar(categories),
        SingleSearchButtonBar(places),
      ],
    );
  }
}

class SingleSearchButtonBar extends StatefulWidget {
  const SingleSearchButtonBar(this.list, {Key? key}) : super(key: key);

  final List<SearchButtonProp> list;

  @override
  State<SingleSearchButtonBar> createState() => _SingleSearchBarState();
}

class _SingleSearchBarState extends State<SingleSearchButtonBar> {
  List<bool> isSelectedList = [];

  @override
  void initState() {
    super.initState();
    isSelectedList = List.generate(widget.list.length, (_) => false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        itemBuilder: (context, index) {
          return Row(
            children: [
              index == 0 ? const SizedBox(width: 10) : const SizedBox(width: 4),
              SearchButton(
                title: widget.list[index].name,
                isSelected: isSelectedList[index],
                onTap: () {
                  setState(() {
                    isSelectedList[index] = !isSelectedList[index];
                    for (var i = 0; i < isSelectedList.length; i++) {
                      if (i != index) {
                        isSelectedList[i] = false;
                      }
                    }
                  });
                },
              ),
              index == widget.list.length - 1
                  ? const SizedBox(width: 10)
                  : const SizedBox(width: 4),
            ],
          );
        },
        itemCount: widget.list.length,
      ),
    );
  }
}
