import 'package:flutter/material.dart';

import 'package:yagamy/model/event_type.dart';

class EventInformationCard extends StatelessWidget {
  const EventInformationCard({required this.eventType, super.key});

  final EventType eventType;

  IconData _eventIcon(EventType eventType) {
    switch (eventType) {
      case EventType.normal:
        return Icons.wb_sunny_outlined;
      case EventType.rain:
        return Icons.cloudy_snowing;
      case EventType.suspension:
        return Icons.event_busy_outlined;
    }
  }

  String _eventText(EventType eventType) {
    switch (eventType) {
      case EventType.normal:
        return '通常開催';
      case EventType.rain:
        return '雨天時開催';
      case EventType.suspension:
        return '中止';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      margin: const EdgeInsets.only(left: 12, top: 5, right: 12, bottom: 10),
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '8月30日 22:31現在',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          const SizedBox(width: 25),
          Icon(
            _eventIcon(eventType),
            size: 25,
          ),
          Text(
            _eventText(eventType),
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
