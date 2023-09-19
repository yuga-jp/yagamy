import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

import 'package:yagamy/constant/theme/shimmer_theme.dart';
import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/provider/project_provider.dart';
import 'package:yagamy/view/common/ui_part/shimmer/shimmer.dart';
import 'package:yagamy/view/common/ui_part/shimmer/shimmer_loading.dart';
import 'package:yagamy/view/page/project_info/ui_part/project_info_body.dart';
import 'package:yagamy/view/page/project_info/ui_part/project_info_body_loading.dart';

class ProjectInfoPage extends ConsumerWidget {
  const ProjectInfoPage(this.id, {super.key});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Project> project = ref.watch(projectProvider(id));
    return project.when(
      loading: () {
        return Material(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Shimmer(
            linearGradient:
                Theme.of(context).extension<ShimmerTheme>()!.shimmerGradient!,
            child: CustomScrollView(
              physics:
                  const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              slivers: <Widget>[
                SliverAppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                  ),
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  floating: true,
                ),
                const SliverToBoxAdapter(
                  child: ShimmerLoading(
                    isLoading: true,
                    child: ProjectInfoBodyLoading(),
                  ),
                )
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Material(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: CustomScrollView(
            physics:
                const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
            slivers: <Widget>[
              SliverAppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                ),
                title: const Text('企画紹介'),
                centerTitle: true,
                floating: true,
              ),
              const SliverToBoxAdapter(child: Text('読み込みに失敗しました'))
            ],
          ),
        );
      },
      data: (project) {
        return Material(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: CustomScrollView(
            physics:
                const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: <Widget>[
              SliverAppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                ),
                title: const Text('企画紹介'),
                centerTitle: true,
                floating: true,
              ),
              ProjectInfoBody(project),
            ],
          ),
        );
      },
    );
  }
}
