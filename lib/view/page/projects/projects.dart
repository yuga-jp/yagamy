import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yagamy/constant/theme/shimmer_theme.dart';

import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/provider/projects_provider.dart';
import 'package:yagamy/view/common/ui_part/shimmer/shimmer.dart';
import 'package:yagamy/view/common/ui_part/shimmer/shimmer_loading.dart';
import 'package:yagamy/view/page/projects/ui_part/project_card_loading.dart';
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
    AsyncValue<List<Project>> projects = ref.watch(projectsProvider);

    return projects.when(
      loading: (() {
        return Shimmer(
          linearGradient:
              Theme.of(context).extension<ShimmerTheme>()!.shimmerGradient!,
          child: ShimmerLoading(
              isLoading: true,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, __) {
                  return const ProjectCardLoading();
                },
                itemCount: 10,
              )),
        );
      }),
      error: (error, stackTrace) {
        return Text('Error: $error');
      },
      data: (projects) {
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
            SliverFixedExtentList(
              itemExtent: 118.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final project = projects[index];
                  return ProjectCard(
                    project: project,
                    onTap: () {
                      GoRouter.of(context)
                          .go('/projects/project/${project.id}');
                    },
                  );
                },
                childCount: projects.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
