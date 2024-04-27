import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:snapvids_app/entry_point.dart';
import 'package:snapvids_app/utils/helpers/toast_helper.dart';
import 'package:snapvids_app/utils/storages/shared_preferences_utils.dart';
import 'package:snapvids_app/utils/themes/app_theme.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  bool isInitCompleted = await SharedPreferencesUtils.init();
  if (isInitCompleted) {
    runApp(
      const ProviderScope(
        child: SnapvidsApp(),
      ),
    );
  }
}

class SnapvidsApp extends StatelessWidget {
  const SnapvidsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snapvids',
      theme: SnapvidsAppTheme.lightTheme,
      darkTheme: SnapvidsAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const NavigationMenu(),
      builder: ToastHelper.init(),
    );
  }
}
