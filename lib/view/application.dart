import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_router/go_router.dart';
import 'package:yagamy/model/notification/parsed_notification.dart';

class Application extends StatefulWidget {
  const Application({super.key});
  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
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
      GoRouter.of(context).go(
        '/notifications/notification/${message.data['id']}',
        extra: ParsedNotification(
          id: message.data['id'],
          title: message.notification!.title!,
          body: message.notification!.body!,
          sentTime: message.sentTime!,
          priority: message.data['priority'],
          relatedProjectId: message.data['relatedProjectId'],
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    setupInterctedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
