import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/provider/provider.dart';
import 'package:yagamy/router/routes.dart';

class CustomNavigationBar extends ConsumerStatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  ConsumerState<CustomNavigationBar> createState() =>
      _CustomNavigationBarState();
}

class _CustomNavigationBarState extends ConsumerState<CustomNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = ref.watch(selectedIndexProvider);
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.event_note),
          icon: Icon(Icons.event_note_outlined),
          label: 'Projects',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule),
          label: 'Timetable',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.map),
          icon: Icon(Icons.map_outlined),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.gamepad),
          icon: Icon(Icons.gamepad_outlined),
          label: 'Contents',
        ),
      ],
      onTap: (index) {
        ref.read(selectedIndexProvider.notifier).state = index;
        routerDelegates[selectedIndex].update(rebuild: false);
      },
      currentIndex: selectedIndex,
      showUnselectedLabels: true,
    );
  }
}
