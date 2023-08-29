import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:yagamy/constant/theme/projects_body_place_theme.dart';
import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/model/searcher_prop.dart';
import 'package:yagamy/view/page/projects/ui_part/project_card.dart';
import 'package:yagamy/view/page/projects/ui_part/search_button_bar.dart';

class ProjectsPlaceBody extends StatelessWidget {
  const ProjectsPlaceBody({
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
    final ProjectsPlaceBodyTheme currentTheme =
        Theme.of(context).extension<ProjectsPlaceBodyTheme>()!;
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        ShaderMask(
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
                    actions: const <Widget>[
                      Icon(Icons.search),
                      SizedBox(width: 15),
                    ],
                    bottom: const PreferredSize(
                      preferredSize: Size.fromHeight(80),
                      child: SearchButtonBar(),
                    ),
                    elevation: 0.0,
                    scrolledUnderElevation: 0.0,
                    backgroundColor: Color.fromRGBO(255, 255, 255,
                        (constraints.scrollOffset / 200).clamp(0, 1.0)),
                    floating: true,
                    pinned: true,
                  );
                },
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        searcherProp.name,
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
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
          ),
        )
      ],
    );
  }
}
