import 'package:flutter/material.dart';
import 'package:snapvids_app/common/routes/routes.dart';
import 'package:snapvids_app/common/theme/dark_theme.dart';
import 'package:snapvids_app/common/theme/light_theme.dart';
import 'package:snapvids_app/feature/auth/pages/user_info_page.dart';

void main() {
  runApp(const SnapvidsApp());
}

class SnapvidsApp extends StatelessWidget {
  const SnapvidsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snapvids',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: const UserInfoPage(),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
