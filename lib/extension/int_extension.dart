extension IntExtension on int {
  String toDisplayMinute() {
    if (this >= 0 && this <= 9) {
      return '0$this';
    } else {
      return toString();
    }
  }
}
