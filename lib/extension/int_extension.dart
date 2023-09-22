extension IntExtension on int {
  String toDisplayDigit() {
    if (this >= 0 && this <= 9) {
      return '0$this';
    } else {
      return toString();
    }
  }
}
