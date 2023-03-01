import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/provider.dart';
import './page/contents.dart';
import './page/home.dart';
import './page/map.dart';
import './page/projects.dart';
import './page/timetable.dart';
import 'widget/custom_navigation_bar.dart';

class NavigationPages extends ConsumerStatefulWidget {
  const NavigationPages({Key? key}) : super(key: key);

  @override
  NavigationPagesState createState() => NavigationPagesState();
}

class NavigationPagesState extends ConsumerState<NavigationPages> {
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
