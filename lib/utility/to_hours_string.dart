import 'package:yagamy/extension/int_extension.dart';

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
      return '23日${s1.hour}:${s1.minute.toDisplayMinute()}-${e1.hour}:${e1.minute.toDisplayMinute()}';
    } else if (s1 != null && e1 == null) {
      return '23日${s1.hour}:${s1.minute.toDisplayMinute()}-';
    }
  } else if (s1 == null && s1 == null) {
    if (s2 != null && e2 != null) {
      return '24日${s2.hour}:${s2.minute.toDisplayMinute()}-${e2.hour}:${e2.minute.toDisplayMinute()}';
    } else if (s2 != null && e2 == null) {
      return '24日${s2.hour}:${s2.minute.toDisplayMinute()}-';
    }
  }
  return '';
}
