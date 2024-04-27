import 'package:snapvids_app/utils/constants/ui_texts.dart';

class Validator {
  Validator._();

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return UiTexts.loginUsernameCanNotBeEmpty;
    }

    if (value.length < 8 || value.length > 20) {
      return UiTexts.loginUsernameLengthError;
    }

    final usernameRegExp = RegExp('^[a-zA-Z]{1}\\w*\$');
    if (!usernameRegExp.hasMatch(value)) {
      return UiTexts.loginUsernameFormatError;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return UiTexts.loginPasswordCanNotBeEmpty;
    }

    if (value.length < 8 || value.length > 20) {
      return UiTexts.loginPasswordLengthError;
    }

    final passwordRegExp = RegExp('^(?![a-zA-Z]+\$)(?!\\d+\$)(?![^\\da-zA-Z\\S]+\$).*\$');
    if (!passwordRegExp.hasMatch(value)) {
      return UiTexts.loginPasswordFormatError;
    }
    return null;
  }

  static String? validateCaptcha(String? value) {
    if (value == null || value.isEmpty) {
      return UiTexts.loginCaptchaCanNotBeEmpty;
    }

    if (value.length < 4 || value.length > 6) {
      return UiTexts.loginCaptchaLengthError;
    }

    final captchaRegExp = RegExp('^[a-zA-Z0-9]+\$');
    if (!captchaRegExp.hasMatch(value)) {
      return UiTexts.loginCaptchaFormatError;
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return UiTexts.loginPhoneNumberCanNotBeEmpty;
    }

    final phoneNumberRegExp =
        RegExp('^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\\d{8}\$');
    if (!phoneNumberRegExp.hasMatch(value)) {
      return UiTexts.loginPhoneNumberFormatError;
    }
    return null;
  }
}
