class DateUtils {
  static int getLocalTimestampInSeconds() {
    return DateTime.now().millisecondsSinceEpoch ~/ 1000;
  }
}
