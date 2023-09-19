import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:yagamy/view/common/ui_part/custom_navigation_bar.dart';

class NavigationPages extends StatefulWidget {
  const NavigationPages({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<NavigationPages> createState() => _NavigationPagesState();
}

class _NavigationPagesState extends State<NavigationPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar:
          CustomNavigationBar(navigationShell: widget.navigationShell),
      resizeToAvoidBottomInset: false,
    );
  }
}
