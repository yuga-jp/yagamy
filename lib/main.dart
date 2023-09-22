import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:yagamy/constant/theme/theme.dart';
import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/router/routes.dart';
import 'package:yagamy/utility/to_notification_priority.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: false,
  );

  await messaging.subscribeToTopic('test');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    setupInterctedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Yagamy',
      theme: AppTheme.defalutAppTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}

@pragma('vm:entry-point')
Future<void> setupInterctedMessage() async {
  // Get any messages which caused the application to open from a terminated state
  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();

  if (initialMessage != null) {
    await _handleMessage(initialMessage);
  }

  // Also handle any interaction when the app is in the background via a Stream listener
  FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
}

@pragma('vm:entry-point')
Future<void> _handleMessage(RemoteMessage message) async {
  router.go(
    '/notifications/message',
    extra: ParsedNotification(
      id: '',
      title: message.notification!.title!,
      body: message.notification!.body!,
      sentTime: DateTime.now(),
      priority: toNotificationPriority(message.data['priority']),
      relatedProjectId: message.data['relatedProjectId'],
      url: message.data['url'],
    ),
  );
}
