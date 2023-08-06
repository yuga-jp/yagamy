import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
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
        widget.navigationShell.goBranch(index);
      },
      currentIndex: widget.navigationShell.currentIndex,
      showUnselectedLabels: true,
    );
  }
}
