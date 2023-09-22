import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/event_info/event_info.dart';
import 'package:yagamy/repository/event_info_repository.dart';

final eventInfoProvider = FutureProvider<EventInfo>((ref) {
  return EventInfoRepository.fetchEventInfo();
});
