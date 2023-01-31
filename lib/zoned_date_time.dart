
extension DateTimeExtension on DateTime {
  DateTime toJst() {
    if (timeZoneName == 'JST') {
      return this;
    }
    return toUtc().add(const Duration(hours: 9));
  }
}