import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapvids_app/utils/helpers/date_helper.dart';
import 'package:snapvids_app/utils/storages/login_storages.dart';

class FunctionHelper {
  FunctionHelper._();

  static bool isLogin() {
    int expiresInSeconds = LoginStorages.getExpiresInSeconds();
    String accessToken = LoginStorages.getAccessToken();
    String refreshToken = LoginStorages.getRefreshToken();
    if (accessToken == '' || refreshToken == '' || expiresInSeconds == 0) {
      return false;
    }

    final int now = DateHelper.getLocalTimestampInSeconds();
    return now < expiresInSeconds;
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (int i = 0; i < widgets.length; i += rowSize) {
      final rowChildren =
          widgets.sublist(i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
