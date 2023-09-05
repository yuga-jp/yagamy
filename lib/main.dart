import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:yagamy/constant/theme/theme.dart';
import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/model/notification/raw_notification.dart';
import 'package:yagamy/router/routes.dart';
import 'package:yagamy/storage/notifications_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: true,
    criticalAlert: false,
    provisional: false,
    sound: false,
  );

  final token = await messaging.getToken();
  print('FCM token: $token');

  // when the application is in the foreground
  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) {
      return;
    },
  );

  // when the application is in the background or terminated
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message);

  await NotificationsStorage.writeNotifications(
      ParsedNotification.fromRawNotification(RawNotification.fromJson({
    'title': message.notification!.title,
    'body': message.notification!.body,
    'sentTime': message.sentTime,
    'priority': '3',
    'relatedProjectId': '0'
  })));
}
