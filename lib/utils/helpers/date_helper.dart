import 'package:intl/intl.dart';

class DateHelper {
  DateHelper._();

  static int getLocalTimestampInSeconds() {
    return DateTime.now().millisecondsSinceEpoch ~/ 1000;
  }

  static String formatDate(DateTime? date, {String pattern = 'dd-MMM-yyyy'}) {
    date ??= DateTime.now();
    return DateFormat(pattern).format(date);
  }
}