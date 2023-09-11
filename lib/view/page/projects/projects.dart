import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/constant/theme/shimmer_theme.dart';
import 'package:yagamy/model/project/project_for_card.dart';
import 'package:yagamy/model/searcher_prop.dart';
import 'package:yagamy/provider/projects_provider.dart';
import 'package:yagamy/provider/selected_searcher_provider.dart';
import 'package:yagamy/view/page/projects/ui_part/project_card_loading.dart';
import 'package:yagamy/view/common/ui_part/shimmer/shimmer.dart';
import 'package:yagamy/view/common/ui_part/shimmer/shimmer_loading.dart';
import 'package:yagamy/view/page/projects/ui_part/projects_body.dart';

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
    AsyncValue<List<ProjectForCard>> projects = ref.watch(projectsProvider);

    return projects.when(
      loading: () {
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
      },
      error: (error, stackTrace) {
        return const CustomScrollView(
          physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          slivers: [
            SliverAppBar(
              title: Text('企画一覧'),
              centerTitle: true,
              floating: true,
              pinned: true,
            ),
            SliverToBoxAdapter(child: Text('読み込みに失敗しました'))
          ],
        );
      },
      data: (projects) {
        List<ProjectForCard> filteredProjects = ref.watch(
            filteredProjectsProvider(ref.watch(selectedSearcherProvider)));
        final SearcherProp selectedSearcher =
            ref.watch(selectedSearcherProvider);

        return selectedSearcher == SearcherProp.initial
            ? ProjectsBody(
                searcherProp: selectedSearcher,
                projects: projects,
                backgroundImageUrl: '',
              )
            : selectedSearcher.isCategoryProp()
                ? ProjectsBody(
                    searcherProp: selectedSearcher,
                    projects: filteredProjects,
                    backgroundImageUrl: '',
                  )
                : ProjectsBody(
                    searcherProp: selectedSearcher,
                    projects: filteredProjects,
                    backgroundImageUrl: 'https://picsum.photos/1200',
                  );
      },
    );
  }
}
