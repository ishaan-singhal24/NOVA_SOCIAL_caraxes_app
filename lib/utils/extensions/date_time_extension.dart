import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get todayYesterdayDate {
    if (isToday) {
      return 'Today';
    }
    if (isYesterday) {
      return 'Yesterday';
    }
    return DateFormat('dd MMMM yy').format(this);
  }

  String get getTime {
    return DateFormat('hh:mm a').format(this);
  }

  String get abrMMMyyyy {
    return DateFormat('MMM yyyy').format(this);
  }

  String get writeDateTime {
    final currentTimeDifference = DateTime.now().difference(this);

    if (isToday || currentTimeDifference.inHours <= 24) {
      if (currentTimeDifference.inHours == 0) {
        return '${currentTimeDifference.inMinutes} mins ago';
      }
      return '${currentTimeDifference.inHours} h ago';
    }
    if (currentTimeDifference.inDays == 1) {
      return '${currentTimeDifference.inDays} day ago';
    }
    return '${currentTimeDifference.inDays} days ago';
    // return '${DateFormat('dd MMM yyyy').format(this)} at ${DateFormat('hh:mm a').format(this)}';
  }

  bool isSameDate(DateTime other) {
    final date = this;

    return date.year == other.year &&
        date.month == other.month &&
        date.day == other.day;
  }

  bool isSameMonth(DateTime other) {
    final date = this;
    return date.year == other.year && date.month == other.month;
  }

  bool get isToday {
    var today = DateTime.now();
    return isSameDate(today);
  }

  bool get isYesterday {
    var yDay = DateTime.now().subtract(const Duration(days: 1));
    return isSameDate(yDay);
  }
}
