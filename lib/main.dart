import 'package:flutter/material.dart';
import 'package:snapvids_app/common/theme/dark_theme.dart';
import 'package:snapvids_app/common/theme/light_theme.dart';
import 'package:snapvids_app/feature/welcome/page/welcome_page.dart';

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
      home: const WelcomePage(),
    );
  }
}
