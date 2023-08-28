import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:yagamy/view/navigation_pages.dart';
import 'package:yagamy/view/page/contents/contents.dart';
import 'package:yagamy/view/page/home/home.dart';
import 'package:yagamy/view/page/map/map.dart';
import 'package:yagamy/view/page/project_info/project_info.dart';
import 'package:yagamy/view/page/projects/projects.dart';
import 'package:yagamy/view/page/timetable/timetable.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home',
    ),
    StatefulShellRoute.indexedStack(
      builder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return NavigationPages(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return buildPageWithoutAnimation(
                  context: context,
                  state: state,
                  child: const HomePage(),
                );
              },
              routes: const <RouteBase>[],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/projects',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return buildPageWithoutAnimation(
                  context: context,
                  state: state,
                  child: const ProjectsPage(),
                );
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'project/:id',
                  builder: (BuildContext context, GoRouterState state) {
                    return ProjectInfoPage(state.pathParameters['id'] ?? '0');
                  },
                )
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/timetable',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return buildPageWithoutAnimation(
                  context: context,
                  state: state,
                  child: const TimetablePage(),
                );
              },
              routes: const <RouteBase>[],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/map',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return buildPageWithoutAnimation(
                  context: context,
                  state: state,
                  child: const MapPage(),
                );
              },
              routes: const <RouteBase>[],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/contents',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return buildPageWithoutAnimation(
                  context: context,
                  state: state,
                  child: const ContentsPage(),
                );
              },
              routes: const <RouteBase>[],
            ),
          ],
        ),
      ],
    )
  ],
);

CustomTransitionPage buildPageWithoutAnimation({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration.zero,
    transitionsBuilder: (_, __, ___, child) {
      return child;
    },
  );
}
