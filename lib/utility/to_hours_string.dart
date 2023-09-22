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

String toHoursStringForCard(
  DateTime? s1,
  DateTime? e1,
  DateTime? s2,
  DateTime? e2,
) {
  if (s1 == null && e1 == null && s2 == null && e2 == null) {
    return ' 両日';
  } else if (s2 == null && e2 == null) {
    if (s1 != null) {
      return '23日${s1.hour}:${s1.minute.toDisplayDigit()}-';
    }
  } else if (s1 == null && s1 == null) {
    if (s2 != null) {
      return '24日${s2.hour}:${s2.minute.toDisplayDigit()}-';
    }
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
      return '${s1.hour}:${s1.minute.toDisplayDigit()}-${e1.hour}:${e1.minute.toDisplayDigit()}';
    } else if (s1 != null && e1 == null) {
      return '${s1.hour}:${s1.minute.toDisplayDigit()}-';
    }
  }

  if (day == TimetableSearcherTypeDay.secondDay) {
    if (s2 != null && e2 != null) {
      return '${s2.hour}:${s2.minute.toDisplayDigit()}-${e2.hour}:${e2.minute.toDisplayDigit()}';
    } else if (s2 != null && e2 == null) {
      return '${s2.hour}:${s2.minute.toDisplayDigit()}-';
    }
  }
  return '';
}
