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
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.event_note),
          icon: Icon(Icons.event_note_outlined),
          label: '企画一覧',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule),
          label: 'タイムテーブル',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.map),
          icon: Icon(Icons.map_outlined),
          label: 'マップ',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.notifications),
          icon: Icon(Icons.notifications_outlined),
          label: '通知',
        ),
      ],
      onTap: (index) {
        widget.navigationShell.goBranch(index);
      },
      currentIndex: widget.navigationShell.currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 11,
      unselectedFontSize: 11,
      selectedLabelStyle: const TextStyle(overflow: TextOverflow.visible),
      unselectedLabelStyle: const TextStyle(overflow: TextOverflow.visible),
      showUnselectedLabels: true,
    );
  }
}
