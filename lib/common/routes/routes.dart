import 'package:flutter/material.dart';
import 'package:snapvids_app/feature/activity/pages/activity_page.dart';
import 'package:snapvids_app/feature/creation/pages/creation_page.dart';
import 'package:snapvids_app/feature/discover/pages/discover_page.dart';
import 'package:snapvids_app/feature/home/pages/home_page.dart';
import 'package:snapvids_app/feature/login/pages/login_page.dart';
import 'package:snapvids_app/feature/profile/pages/profile_page.dart';

class Routes {
  static const String login = 'login';
  static const String home = 'home';
  static const String discover = 'discover';
  static const String creation = 'creation';
  static const String activity = 'activity';
  static const String profile = 'profile';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case discover:
        return MaterialPageRoute(
          builder: (context) => const DiscoverPage(),
        );
      case creation:
        return MaterialPageRoute(
          builder: (context) => const CreationPage(),
        );
      case activity:
        return MaterialPageRoute(
          builder: (context) => const ActivityPage(),
        );
      case profile:
        return MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No Page Route Provided'),
            ),
          ),
        );
    }
  }
}
