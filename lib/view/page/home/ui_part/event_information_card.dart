import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yagamy/extension/int_extension.dart';
import 'package:yagamy/extension/string_extension.dart';
import 'package:yagamy/model/event_info/event_info.dart';

import 'package:yagamy/model/event_type.dart';
import 'package:yagamy/provider/event_info_provider.dart';

class EventInformationCard extends ConsumerWidget {
  const EventInformationCard({super.key});

  String _toDisplayDateTime(DateTime dateTime) {
    final DateTime localizedDateTime = dateTime.toLocal();
    return '${localizedDateTime.month}月${localizedDateTime.day}日 ${localizedDateTime.hour.toDisplayDigit()}:${localizedDateTime.minute.toDisplayDigit()}現在';
  }

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
      child: eventInfo.when(
        loading: () {
          return const SizedBox(height: 30);
        },
        error: (error, stackTrace) {
          return const SizedBox();
        },
        data: (eventInfo) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _toDisplayDateTime(eventInfo.updatedAt),
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(width: 25),
              Icon(
                _eventIcon(eventInfo.eventType.toEventType()!),
                size: 25,
              ),
              Text(
                _eventText(eventInfo.eventType.toEventType()!),
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          );
        },
      ),
    );
  }
}
