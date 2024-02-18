import 'package:yagamy/extension/int_extension.dart';
import 'package:yagamy/model/timetable_searcher_type.dart';

String toHoursString(
  DateTime? s1,
  DateTime? e1,
  DateTime? s2,
  DateTime? e2,
) {
  if (s1 == null && e1 == null && s2 == null && e2 == null) {
    return ' 両日';
  } else if (s2 == null && e2 == null) {
    if (s1 != null && e1 != null) {
      return '23日${s1.hour}:${s1.minute.toDisplayDigit()}-${e1.hour}:${e1.minute.toDisplayDigit()}';
    } else if (s1 != null && e1 == null) {
      return '23日${s1.hour}:${s1.minute.toDisplayDigit()}-';
    }
  } else if (s1 == null && s1 == null) {
    if (s2 != null && e2 != null) {
      return '24日${s2.hour}:${s2.minute.toDisplayDigit()}-${e2.hour}:${e2.minute.toDisplayDigit()}';
    } else if (s2 != null && e2 == null) {
      return '24日${s2.hour}:${s2.minute.toDisplayDigit()}-';
    }
  }
  return '';
}

String getHoursDisplayingForCard(
  DateTime? s1,
  DateTime? e1,
  DateTime? s2,
  DateTime? e2,
) {
  if (s1 == null && e1 == null && s2 == null && e2 == null) {
    return ' 両日';
  } else if (s1 == null || s2 == null) {
    if (s1 != null) {
      return '23日${s1.hour.toDisplayDigit()}:${s1.minute.toDisplayDigit()}-';
    } else if (s2 != null) {
      return '24日${s2.hour.toDisplayDigit()}:${s2.minute.toDisplayDigit()}-';
    }
  } else if (DateTime.now()
      .toLocal()
      .isBefore(DateTime(2023, 9, 24, 0, 0).toLocal())) {
    return '23日${s1.hour.toDisplayDigit()}:${s1.minute.toDisplayDigit()}-';
  } else {
    return '24日${s2.hour.toDisplayDigit()}:${s2.minute.toDisplayDigit()}-';
  }
  return '';
}

String toHoursStringForTimetable(
  DateTime? s1,
  DateTime? e1,
  DateTime? s2,
  DateTime? e2,
  TimetableSearcherTypeDay day,
) {
  if (day == TimetableSearcherTypeDay.firstDay) {
    if (s1 != null && e1 != null) {
      return '${s1.hour.toDisplayDigit()}:${s1.minute.toDisplayDigit()}-${e1.hour.toDisplayDigit()}:${e1.minute.toDisplayDigit()}';
    } else if (s1 != null && e1 == null) {
      return '${s1.hour.toDisplayDigit()}:${s1.minute.toDisplayDigit()}-';
    }
  }

  if (day == TimetableSearcherTypeDay.secondDay) {
    if (s2 != null && e2 != null) {
      return '${s2.hour.toDisplayDigit()}:${s2.minute.toDisplayDigit()}-${e2.hour.toDisplayDigit()}:${e2.minute.toDisplayDigit()}';
    } else if (s2 != null && e2 == null) {
      return '${s2.hour.toDisplayDigit()}:${s2.minute.toDisplayDigit()}-';
    }
  }
  return '';
}
