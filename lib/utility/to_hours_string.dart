String toHoursString(
  DateTime? s1,
  DateTime? e1,
  DateTime? s2,
  DateTime? e2,
) {
  if (s1 == null && e1 == null && s2 == null && e2 == null) {
    return '両日';
  } else if (s2 == null && e2 == null) {
    if (s1 != null && e1 != null) {
      return '23/${s1.hour}:${s1.minute}-${e1.hour}:${e1.minute}';
    }
    if (s1 != null && e1 == null) {
      return '23/${s1.hour}:${s1.minute}-';
    }
  } else if (s1 == null && s1 == null) {
    if (s2 != null && e2 != null) {
      return '24/${s2.hour}:${s2.minute}-${e2.hour}:${e2.minute}';
    }
    if (s2 != null && e2 == null) {
      return '24/${s2.hour}:${s2.minute}-';
    }
  }
  return '';
}
