import 'package:flutter/material.dart';
import 'package:snapvids_app/common/store/login_store.dart';
import 'package:snapvids_app/feature/index/pages/index_page.dart';
import 'package:snapvids_app/feature/login/pages/login_page.dart';

class Routes {
  static const String index = 'index';
  static const String login = 'login';
  static const String home = 'home';
  static const String discover = 'discover';
  static const String creation = 'creation';
  static const String activity = 'activity';
  static const String profile = 'profile';
  static const String notFound = 'notFound';
  static const List<String> _whiteList = [index, login, home, notFound];

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    String jumpRouteName = routeBeforeHook(settings.name);

    switch (jumpRouteName) {
      case index:
        return MaterialPageRoute(
          builder: (context) => const IndexPage(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case notFound:
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

  static String routeBeforeHook(String? routeName) {
    final bool isLogin = LoginStore.isLogin();
    if (isLogin || _whiteList.contains(routeName)) {
      return routeName ?? notFound;
    }

    return login;
  }
}
