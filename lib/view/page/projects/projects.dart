import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:yagamy/view/page/projects/ui_part/search_button_bar.dart';
import 'package:yagamy/view/page/projects/ui_part/project_card.dart';

class ProjectsPage extends ConsumerStatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends ConsumerState<ProjectsPage> {
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
              return ProjectCard(
                title: 'Quiz30問！',
                groupName: '慶應Quiz研究会',
                imageUrl: 'https://picsum.photos/300/300',
                placeName: '14棟-101教室',
                time: '10:00-15:00',
                onTap: () {
                  GoRouter.of(context).go('/projects/project');
                },
              );
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
