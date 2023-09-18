import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yagamy/model/home/event_info.dart';
import 'package:yagamy/repository/event_info_repository.dart';

final eventInfoProvider = FutureProvider<EventInfo>((ref) async {
  return EventInfoRepository.fetchEventInfo();
});
