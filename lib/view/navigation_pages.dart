import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yagamy/provider/provider.dart';

import 'package:yagamy/view/page/home/appbar.dart';
import 'package:yagamy/view/page/contents/appbar.dart';
import 'package:yagamy/view/common/ui_part/custom_navigation_bar.dart';
import 'package:yagamy/view/page/project_info/appbar.dart';

class NavigationPages extends ConsumerWidget {
  const NavigationPages({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  AppBar? _getAppBar(int index, bool showProjectAppBar) {
    switch (index) {
      case 0:
        return homeAppBar();
      case 1:
        return showProjectAppBar ? projectInfoAppBar(() {}) : null;
      case 2:
        return null;
      case 3:
        return homeAppBar();
      case 4:
        return contentsAppBar();
      default:
        return homeAppBar();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: () {
        switch (navigationShell.currentIndex) {
          case 0:
            return homeAppBar();
          case 1:
            return ref.watch(showProjectAppBar)
                ? projectInfoAppBar(() {
                    ref.read(showProjectAppBar.notifier).state = false;
                    GoRouter.of(context).pop();
                  })
                : null;
          case 2:
            return null;
          case 3:
            return homeAppBar();
          case 4:
            return contentsAppBar();
          default:
            return homeAppBar();
        }
      }(),
      body: SafeArea(child: navigationShell),
      bottomNavigationBar:
          CustomNavigationBar(navigationShell: navigationShell),
      resizeToAvoidBottomInset: false,
    );
  }
}
