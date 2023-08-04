extension StringExtension on String {
  String get firstCap {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
