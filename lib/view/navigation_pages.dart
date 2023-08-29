import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:yagamy/view/common/ui_part/custom_navigation_bar.dart';

class NavigationPages extends ConsumerWidget {
  const NavigationPages({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar:
          CustomNavigationBar(navigationShell: navigationShell),
      resizeToAvoidBottomInset: false,
    );
  }
}
