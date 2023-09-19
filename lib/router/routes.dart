import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:yagamy/model/map_type.dart';

import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/view/navigation_pages.dart';
import 'package:yagamy/view/page/home/home.dart';
import 'package:yagamy/view/page/map/map.dart';
import 'package:yagamy/view/page/map/ui_part/map_viewer.dart';
import 'package:yagamy/view/page/notification_info/notification_info.dart';
import 'package:yagamy/view/page/notification_info/notification_info_from_message.dart';
import 'package:yagamy/view/page/notifications/notifications.dart';
import 'package:yagamy/view/page/project_info/project_info.dart';
import 'package:yagamy/view/page/project_info/project_info_from_notification.dart';
import 'package:yagamy/view/page/projects/projects.dart';
import 'package:yagamy/view/page/timetable/timetable.dart';

final _mapPageNavigatorKey = GlobalKey<NavigatorState>();

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
                ),
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
          navigatorKey: _mapPageNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/map',
              redirect: (_, __) => '/map/whole_area',
            ),
            StatefulShellRoute.indexedStack(
              builder: (
                BuildContext context,
                GoRouterState state,
                StatefulNavigationShell navigationShell,
              ) {
                return MapPage(navigationShell: navigationShell);
              },
              branches: <StatefulShellBranch>[
                StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: '/map/whole_area',
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return buildPageWithoutAnimation(
                          context: context,
                          state: state,
                          child: const MapViewer(mapType: MapType.wholeArea),
                        );
                      },
                      routes: <RouteBase>[
                        GoRoute(
                          path: 'project/:id',
                          builder: (BuildContext context, GoRouterState state) {
                            return ProjectInfoPage(state.pathParameters['id']!);
                          },
                          parentNavigatorKey: _mapPageNavigatorKey,
                        ),
                      ],
                    ),
                    GoRoute(
                      path: '/map/eleven',
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return buildPageWithoutAnimation(
                          context: context,
                          state: state,
                          child: const MapViewer(mapType: MapType.eleven),
                        );
                      },
                      routes: <RouteBase>[
                        GoRoute(
                          path: 'project/:id',
                          builder: (BuildContext context, GoRouterState state) {
                            return ProjectInfoPage(state.pathParameters['id']!);
                          },
                          parentNavigatorKey: _mapPageNavigatorKey,
                        ),
                      ],
                    ),
                    GoRoute(
                      path: '/map/twelve',
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return buildPageWithoutAnimation(
                          context: context,
                          state: state,
                          child: const MapViewer(mapType: MapType.twelve),
                        );
                      },
                      routes: <RouteBase>[
                        GoRoute(
                          path: 'project/:id',
                          builder: (BuildContext context, GoRouterState state) {
                            return ProjectInfoPage(state.pathParameters['id']!);
                          },
                          parentNavigatorKey: _mapPageNavigatorKey,
                        ),
                      ],
                    ),
                    GoRoute(
                      path: '/map/fourteen',
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return buildPageWithoutAnimation(
                          context: context,
                          state: state,
                          child: const MapViewer(mapType: MapType.fourteen),
                        );
                      },
                      routes: <RouteBase>[
                        GoRoute(
                          path: 'project/:id',
                          builder: (BuildContext context, GoRouterState state) {
                            return ProjectInfoPage(state.pathParameters['id']!);
                          },
                          parentNavigatorKey: _mapPageNavigatorKey,
                        ),
                      ],
                    ),
                    GoRoute(
                      path: '/map/east_area_ground',
                      pageBuilder: (BuildContext context, GoRouterState state) {
                        return buildPageWithoutAnimation(
                          context: context,
                          state: state,
                          child:
                              const MapViewer(mapType: MapType.eastAreaGround),
                        );
                      },
                      routes: <RouteBase>[
                        GoRoute(
                          path: 'project/:id',
                          builder: (BuildContext context, GoRouterState state) {
                            return ProjectInfoPage(state.pathParameters['id']!);
                          },
                          parentNavigatorKey: _mapPageNavigatorKey,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/notifications',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return buildPageWithoutAnimation(
                  context: context,
                  state: state,
                  child: const NotificationsPage(),
                );
              },
              routes: <RouteBase>[
                GoRoute(
                    path: 'notification/:id',
                    builder: (BuildContext context, GoRouterState state) {
                      return NotificationInfoPage(
                        state.pathParameters['id'] ?? '0',
                      );
                    },
                    routes: <RouteBase>[
                      GoRoute(
                        path: 'project',
                        builder: (BuildContext context, GoRouterState state) {
                          return ProjectInfoFromNotificationPage(
                            state.extra as Project,
                          );
                        },
                      ),
                    ]),
                GoRoute(
                  path: 'message',
                  builder: (BuildContext context, GoRouterState state) {
                    return NotificationInfoFromMessagePage(
                      state.extra as ParsedNotification,
                    );
                  },
                ),
              ],
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
