import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/provider/provider.dart';
import 'package:yagamy/router/routes.dart';
import 'package:yagamy/ui/widget/custom_appbars.dart';
import 'package:yagamy/ui/widget/custom_navigation_bar.dart';

class NavigationPages extends ConsumerStatefulWidget {
  const NavigationPages({Key? key}) : super(key: key);

  @override
  ConsumerState<NavigationPages> createState() => _NavigationPagesState();
}

class _NavigationPagesState extends ConsumerState<NavigationPages> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  AppBar? _appBar() {
    return _getAppBar(ref.watch(selectedIndexProvider));
  }

  Widget _body() {
    return IndexedStack(
      index: ref.watch(selectedIndexProvider),
      children: [
        Beamer(routerDelegate: routerDelegates[0]),
        Beamer(routerDelegate: routerDelegates[1]),
        Beamer(routerDelegate: routerDelegates[2]),
        Beamer(routerDelegate: routerDelegates[3]),
        Beamer(routerDelegate: routerDelegates[4]),
      ],
    );
  }

  AppBar? _getAppBar(int index) {
    switch (index) {
      case 0:
        return homeAppBar();
      case 1:
        return null;
      case 2:
        return homeAppBar();
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
      body: SafeArea(child: _body()),
      bottomNavigationBar: const CustomNavigationBar(),
      resizeToAvoidBottomInset: false,
    );
  }
}
