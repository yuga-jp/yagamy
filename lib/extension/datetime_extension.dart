extension DateTimeExtension on DateTime {
  String toDisplayJpString() {
    return '$year年 $month月$day日 $hour時$minute分';
  }
}