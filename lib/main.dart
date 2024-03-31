import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapvids_app/common/routes/routes.dart';
import 'package:snapvids_app/common/theme/dark_theme.dart';
import 'package:snapvids_app/common/theme/light_theme.dart';
import 'package:snapvids_app/feature/login/pages/login_page.dart';

import 'common/widgets/toast.dart';

void main() {
  runApp(
    const ProviderScope(
      child: SnapvidsApp(),
    ),
  );
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
      home: const LoginPage(),
      onGenerateRoute: Routes.onGenerateRoute,
      builder: Toast.init(),
    );
  }
}
