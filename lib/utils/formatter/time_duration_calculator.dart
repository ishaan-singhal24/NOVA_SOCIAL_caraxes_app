class DateTimeFormatter {
  static String timeDurationCalculator(DateTime? from, DateTime? to) {
    if (from == null) {
      return '';
    }
    from = DateTime(from.year, from.month, from.day);

    if (to == null) {
      DateTime now = DateTime.now();
      now = DateTime(now.year, now.month, now.day);
      to = now;
    } else {
      to = DateTime(to.year, to.month, to.day);
    }

    int days = (to.difference(from).inHours / 24).round();
    int months = (days / 30.44).round();
    int years = (days / 365.25).floor();
    int remMonths = months % 12;
    if (years > 0 && remMonths == 0) {
      if (years == 1) {
        return '$years Yr';
      }
      return '$years Yrs';
    } else if (years > 0 && remMonths != 0) {
      if (years == 1) {
        return '$years Yr $remMonths Mos';
      }
      return '$years Yrs $remMonths Mos';
    } else if (months > 0) {
      return '$months Months';
    } else {
      return '$days Days';
    }
  }
}
