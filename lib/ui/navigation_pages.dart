import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/provider/provider.dart';
import 'package:yagamy/ui/page/contents.dart';
import 'package:yagamy/ui/page/home.dart';
import 'package:yagamy/ui/page/map.dart';
import 'package:yagamy/ui/page/projects.dart';
import 'package:yagamy/ui/page/timetable.dart';
import 'package:yagamy/ui/widget/custom_navigation_bar.dart';

class NavigationPages extends ConsumerStatefulWidget {
  const NavigationPages({Key? key}) : super(key: key);

  @override
  ConsumerState<NavigationPages> createState() => _NavigationPagesState();
}

class _NavigationPagesState extends ConsumerState<NavigationPages> {
  @override
  void dispose() {
    super.dispose();
  }

  Widget _body() {
    return Container(
      child: _getPage(ref.watch(selectedIndexProvider)),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return ProjectsPage();
        case 2:
        return TimetablePage();
        case 3:
        return MapPage();
        case 4:
        return ContentsPage();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
