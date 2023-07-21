import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import 'package:yagamy/view/navigation_pages.dart';
import 'package:yagamy/view/page/contents/contents.dart';
import 'package:yagamy/view/page/home/home.dart';
import 'package:yagamy/view/page/map/map.dart';
import 'package:yagamy/view/page/projects/projects.dart';
import 'package:yagamy/view/page/timetable/timetable.dart';

final routerDelegate = BeamerDelegate(
  initialPath: '/navigation',
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/navigation': (context, state, data) => const NavigationPages(),
    },
  ),
);

final navigationRouterDelegates = [
  BeamerDelegate(
    initialPath: '/home',
    locationBuilder: (routeInformation, _) {
      if (routeInformation.location!.contains('home')) {
        return HomeLocation(routeInformation);
      }
      return NotFound(path: routeInformation.location!);
    },
  ),
  BeamerDelegate(
    initialPath: '/projects',
    locationBuilder: (routeInformation, _) {
      if (routeInformation.location!.contains('projects')) {
        return ProjectsLocation(routeInformation);
      }
      return NotFound(path: routeInformation.location!);
    },
  ),
  BeamerDelegate(
    initialPath: '/timetable',
    locationBuilder: (routeInformation, _) {
      if (routeInformation.location!.contains('timetable')) {
        return TimetableLocation(routeInformation);
      }
      return NotFound(path: routeInformation.location!);
    },
  ),
  BeamerDelegate(
    initialPath: '/map',
    locationBuilder: (routeInformation, _) {
      if (routeInformation.location!.contains('map')) {
        return MapLocation(routeInformation);
      }
      return NotFound(path: routeInformation.location!);
    },
  ),
  BeamerDelegate(
    initialPath: '/contents',
    locationBuilder: (routeInformation, _) {
      if (routeInformation.location!.contains('contents')) {
        return ContentsLocation(routeInformation);
      }
      return NotFound(path: routeInformation.location!);
    },
  ),
];

class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation(super.routeInformation);

  @override
  List<String> get pathPatterns => ['/home/'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('home'),
          title: 'Home',
          type: BeamPageType.noTransition,
          child: HomePage(),
        ),
      ];
}

class ProjectsLocation extends BeamLocation<BeamState> {
  ProjectsLocation(super.routeInformation);

  @override
  List<String> get pathPatterns => ['/projects/'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('projects'),
          title: 'Projects',
          type: BeamPageType.noTransition,
          child: ProjectsPage(),
        )
      ];
}

class TimetableLocation extends BeamLocation<BeamState> {
  TimetableLocation(super.routeInformation);

  @override
  List<String> get pathPatterns => ['/timetable/'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('timetable'),
          title: 'Timetable',
          type: BeamPageType.noTransition,
          child: TimetablePage(),
        )
      ];
}

class MapLocation extends BeamLocation<BeamState> {
  MapLocation(super.routeInformation);

  @override
  List<String> get pathPatterns => ['/map/'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('map'),
          title: 'Map',
          type: BeamPageType.noTransition,
          child: MapPage(),
        )
      ];
}

class ContentsLocation extends BeamLocation<BeamState> {
  ContentsLocation(super.routeInformation);

  @override
  List<String> get pathPatterns => ['/contents/'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('contents'),
          title: 'Contents',
          type: BeamPageType.noTransition,
          child: ContentsPage(),
        )
      ];
}
