import 'dart:math';

class NumberUtils {
  static String formatNumberWithUnit(double num, {int digits = 2}) {
    if (num == 0) return '0';

    int symbol = 1;
    if (num < 0) {
      num *= -1;
      symbol = -1;
    }

    List<Map<String, dynamic>> lookup = [
      {'value': 1, 'symbol': ''},
      {'value': pow(10, 3), 'symbol': 'K'},
      {'value': pow(10, 6), 'symbol': 'M'},
      {'value': pow(10, 9), 'symbol': 'G'},
      {'value': pow(10, 12), 'symbol': 'T'},
      {'value': pow(10, 15), 'symbol': 'P'},
      {'value': pow(10, 18), 'symbol': 'E'}
    ];

    RegExp regexp = RegExp(r'\.0+$|(?<=\.[0-9]*[1-9])0+$');

    Map<String, dynamic> item = lookup.lastWhere((element) => num >= element['value']);

    double dividedNum = num / item['value'] * symbol;
    // toStringAsFixed 会自动四舍五入，坑！
    // String formattedNum = dividedNum.toStringAsFixed(digits);
    String formattedNum = truncateDecimalPlaces(dividedNum, digits);
    return formattedNum.replaceAllMapped(regexp, (match) => '').trim() + item['symbol'];
  }

  static String formatNumberWithChineseUnit(double num, {int digits = 1}) {
    if (num == 0) return '0';

    int symbol = 1;
    if (num < 0) {
      num *= -1;
      symbol = -1;
    }

    List<Map<String, dynamic>> lookup = [
      {'value': 1, 'symbol': ''},
      {'value': pow(10, 4), 'symbol': '万'},
      {'value': pow(10, 8), 'symbol': '亿'},
      {'value': pow(10, 12), 'symbol': '万亿'},
      {'value': pow(10, 16), 'symbol': '十万亿'},
      {'value': pow(10, 20), 'symbol': '百亿'},
      {'value': pow(10, 24), 'symbol': '千亿'}
    ];

    RegExp regexp = RegExp(r'\.0+$|(?<=\.[0-9]*[1-9])0+$');

    Map<String, dynamic> item = lookup.lastWhere((element) => num >= element['value']);

    double dividedNum = num / item['value'] * symbol;
    // toStringAsFixed 会自动四舍五入，坑！
    // String formattedNum = dividedNum.toStringAsFixed(digits);
    String formattedNum = truncateDecimalPlaces(dividedNum, digits);
    return formattedNum.replaceAllMapped(regexp, (match) => '').trim() + item['symbol'];
  }

  static String truncateDecimalPlaces(double number, int desiredPrecision) {
    String strNumber = number.toString();
    int dotIndex = strNumber.indexOf('.');

    if (dotIndex != -1) {
      int endIndex = min(dotIndex + desiredPrecision + 1, strNumber.length);
      strNumber = strNumber.substring(0, endIndex);
      int currentPrecision = strNumber.length - 1 - dotIndex;
      if (currentPrecision < desiredPrecision) {
        strNumber += '0' * (desiredPrecision - currentPrecision);
      }
    } else {
      strNumber += '.${'0' * desiredPrecision}';
    }

    return strNumber;
  }
}
