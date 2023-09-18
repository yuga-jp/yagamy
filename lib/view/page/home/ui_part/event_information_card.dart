import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/event_type.dart';
import 'package:yagamy/model/home/event_info.dart';
import 'package:yagamy/provider/event_info_provider.dart';

class EventInformationCard extends ConsumerWidget {
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

  String formatDateTimeToJapanese(DateTime dateTime) {
    // make datetime to japanese
    DateTime JSTDateTime = dateTime.toLocal();
    String month = JSTDateTime.month.toString();
    String day = JSTDateTime.day.toString();
    String hour = JSTDateTime.hour.toString().padLeft(2, '0');
    String minute = JSTDateTime.minute.toString().padLeft(2, '0');

    return '${month}月${day}日 ${hour}:${minute}現在 ';
  }

  EventType? stringToEventType(String eventTypeStr) {
    switch (eventTypeStr) {
      case 'normal':
        return EventType.normal;
      case 'rain':
        return EventType.rain;
      case 'suspension':
        return EventType.suspension;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<EventInfo> eventInfo = ref.watch(eventInfoProvider);

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
          Text(
            eventInfo.when(
              data: (data) => formatDateTimeToJapanese(data.updatedAt),
              loading: () => 'Loading...',
              error: (error, stackTrace) => 'Error',
            ),
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          Icon(
            _eventIcon(stringToEventType(eventInfo.value?.eventType ?? '') ??
                EventType.normal),
            size: 25,
          ),
          Text(
            _eventText(stringToEventType(eventInfo.value?.eventType ?? '') ??
                EventType.normal),
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
