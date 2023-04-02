import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import 'package:yagamy/ui/navigation_pages.dart';
import 'package:yagamy/ui/page/contents.dart';
import 'package:yagamy/ui/page/home.dart';
import 'package:yagamy/ui/page/map.dart';
import 'package:yagamy/ui/page/projects.dart';
import 'package:yagamy/ui/page/splash.dart';
import 'package:yagamy/ui/page/timetable.dart';

final routerDelegate = BeamerDelegate(
  initialPath: '/projects',
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '*': (context, state, data) => const NavigationPages(),
    },
  ),
);

final routerDelegates = [
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
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('home'),
          title: 'Tab Home',
          type: BeamPageType.noTransition,
          child: HomePage(),
        ),
      ];
}

class ProjectsLocation extends BeamLocation<BeamState> {
  ProjectsLocation(super.routeInformation);

  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('projects'),
          title: 'Tab Projects',
          type: BeamPageType.noTransition,
          child: ProjectsPage(),
        )
      ];
}

class TimetableLocation extends BeamLocation<BeamState> {
  TimetableLocation(super.routeInformation);

  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('timetable'),
          title: 'Tab Timetable',
          type: BeamPageType.noTransition,
          child: TimetablePage(),
        )
      ];
}

class MapLocation extends BeamLocation<BeamState> {
  MapLocation(super.routeInformation);

  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('map'),
          title: 'Tab Map',
          type: BeamPageType.noTransition,
          child: MapPage(),
        )
      ];
}

class ContentsLocation extends BeamLocation<BeamState> {
  ContentsLocation(super.routeInformation);

  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('contents'),
          title: 'Tab Contents',
          type: BeamPageType.noTransition,
          child: ContentsPage(),
        )
      ];
}
