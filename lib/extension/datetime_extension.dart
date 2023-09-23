import 'package:yagamy/extension/int_extension.dart';

extension DateTimeExtension on DateTime {
  String toDisplayJpString() {
    return '$year年 $month月$day日 ${hour.toDisplayDigit()}時${minute.toDisplayDigit()}分';
  }

  String toNotificationPageJpString() {
    if (day == DateTime.now().toLocal().day) {
      return '${hour.toDisplayDigit()}時${minute.toDisplayDigit()}分';
    } else {
      return '$month月$day日 ${hour.toDisplayDigit()}時${minute.toDisplayDigit()}分';
    }
  }
}
