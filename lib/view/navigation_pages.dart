import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:yagamy/view/page/home/appbar.dart';
import 'package:yagamy/view/page/contents/appbar.dart';
import 'package:yagamy/view/common/ui_part/custom_navigation_bar.dart';
import 'package:yagamy/view/page/project_info/appbar.dart';

class NavigationPages extends StatelessWidget {
  const NavigationPages({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  AppBar? _appBar() {
    return _getAppBar(navigationShell.currentIndex);
  }

  AppBar? _getAppBar(int index) {
    switch (index) {
      case 0:
        return homeAppBar();
      case 1:
        return null;
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(child: navigationShell),
      bottomNavigationBar:
          CustomNavigationBar(navigationShell: navigationShell),
      resizeToAvoidBottomInset: false,
    );
  }
}
