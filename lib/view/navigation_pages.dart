import 'package:firebase_messaging/firebase_messaging.dart';
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
  Future<void> setupInterctedMessage() async {
    // Get any messages which caused the application to open from a terminated state
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    if (message.data['id'] != null) {
      GoRouter.of(context)
          .go('/notifications/notification/${message.data['id']}');
    }
  }

  @override
  void initState() {
    super.initState();
    setupInterctedMessage();
  }

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
