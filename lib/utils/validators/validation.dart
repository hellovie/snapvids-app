import 'package:snapvids_app/utils/constants/texts.dart';

class SValidator {
  SValidator._();

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return STexts.usernameCanNotBeEmpty;
    }

    if (value.length < 8 || value.length > 20) {
      return STexts.usernameLengthError;
    }

    final usernameRegExp = RegExp('^[a-zA-Z]{1}\\w*\$');
    if (!usernameRegExp.hasMatch(value)) {
      return STexts.usernameFormatError;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return STexts.passwordCanNotBeEmpty;
    }

    if (value.length < 8 || value.length > 20) {
      return STexts.passwordLengthError;
    }

    final passwordRegExp = RegExp('^(?![a-zA-Z]+\$)(?!\\d+\$)(?![^\\da-zA-Z\\S]+\$).*\$');
    if (!passwordRegExp.hasMatch(value)) {
      return STexts.passwordFormatError;
    }
    return null;
  }

  static String? validateCaptcha(String? value) {
    if (value == null || value.isEmpty) {
      return STexts.captchaCanNotBeEmpty;
    }

    if (value.length > 6) {
      return STexts.captchaLengthError;
    }

    final captchaRegExp = RegExp('^[a-zA-Z0-9]+\$');
    if (!captchaRegExp.hasMatch(value)) {
      return STexts.captchaFormatError;
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return STexts.phoneNumberCanNotBeEmpty;
    }

    final phoneNumberRegExp =
        RegExp('^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\\d{8}\$');
    if (!phoneNumberRegExp.hasMatch(value)) {
      return STexts.phoneNumberFormatError;
    }
    return null;
  }
}
