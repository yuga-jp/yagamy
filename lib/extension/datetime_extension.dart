extension DateTimeExtension on DateTime {
  String toDisplayJpString({bool? displayYear}) {
    if (displayYear == true || displayYear == null) {
      return '$year年 $month月$day日 $hour時$minute分';
    } else {
      return '$month月$day日 $hour時$minute分';
    }
  }
}
