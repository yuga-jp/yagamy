import 'package:flutter/material.dart';
import 'package:yagamy/model/notification/parsed_notification.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({required this.notification, super.key});

  final ParsedNotification notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                notification.title,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                notification.body,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}
