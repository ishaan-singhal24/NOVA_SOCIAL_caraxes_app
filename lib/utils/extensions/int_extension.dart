extension IntExtension on int {
  String get twoDigit {
    String number = toString();
    if (number.length == 1) {
      number = '0$number';
    }
    return number;
  }
}
