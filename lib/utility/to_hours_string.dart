String toHoursString(
  DateTime? hoursStartFirstDay,
  DateTime? hoursEndFirstday,
  DateTime? hoursStartSecondDay,
  DateTime? hoursEndSecondDay,
) {
  String hoursString = '';
  if (hoursStartFirstDay == null &&
      hoursStartSecondDay == null &&
      hoursStartSecondDay == null &&
      hoursEndSecondDay == null) {
    hoursString = '両日';
  } else if (hoursStartFirstDay != null && hoursEndFirstday != null) {
    hoursString =
        '${hoursStartFirstDay.hour}:${hoursStartFirstDay.minute}-${hoursEndFirstday.hour}:${hoursEndFirstday.minute}';
  } else if (hoursStartSecondDay != null && hoursEndSecondDay != null) {
    hoursString =
        '${hoursStartSecondDay.hour}:${hoursStartSecondDay.minute}-${hoursEndSecondDay.hour}:${hoursEndSecondDay.minute}';
  }
  return hoursString;
}
