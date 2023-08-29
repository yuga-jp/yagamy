import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:yagamy/constant/theme/projects_body_theme.dart';
import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/model/searcher_prop.dart';
import 'package:yagamy/view/page/projects/ui_part/project_list.dart';
import 'package:yagamy/view/page/projects/ui_part/search_button_bar.dart';

class ProjectsBody extends StatelessWidget {
  const ProjectsBody({
    required this.searcherProp,
    required this.projects,
    required this.backgroundImageUrl,
    super.key,
  });

  final SearcherProp searcherProp;
  final List<Project> projects;
  final String backgroundImageUrl;

  @override
  Widget build(BuildContext context) {
    final ProjectsBodyTheme currentTheme =
        Theme.of(context).extension<ProjectsBodyTheme>()!;
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        !searcherProp.isPlaceProp()
            ? const SizedBox.shrink()
            : ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      currentTheme.gradientStartColor!,
                      currentTheme.gradientEndColor!,
                    ],
                    stops: const [0.0, 0.9],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcOver,
                child: Image.network(
                  backgroundImageUrl,
                  fit: BoxFit.fitWidth,
                ),
              ),
        Material(
          color: currentTheme.backgroundBaseColor,
          child: CustomScrollView(
            physics:
                const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: <Widget>[
              SliverLayoutBuilder(
                builder: (BuildContext context, SliverConstraints constraints) {
                  return SliverAppBar(
                    title: const Text('企画一覧'),
                    bottom: const PreferredSize(
                      preferredSize: Size.fromHeight(80),
                      child: SearchButtonBar(),
                    ),
                    elevation: !searcherProp.isPlaceProp() ? null : 0.0,
                    scrolledUnderElevation:
                        !searcherProp.isPlaceProp() ? null : 0.0,
                    backgroundColor: currentTheme.gradientEndColor!.withOpacity(
                        (constraints.scrollOffset / 200).clamp(0.0, 1.0)),
                    centerTitle: true,
                    floating: true,
                    pinned: true,
                  );
                },
              ),
              !searcherProp.isPlaceProp()
                  ? const SliverToBoxAdapter()
                  : SliverToBoxAdapter(
                      child: SizedBox(
                        height: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              searcherProp.name,
                              style: const TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 20)
                          ],
                        ),
                      ),
                    ),
              ProjectList(projects: projects),
            ],
          ),
        ),
      ],
    );
  }
}
