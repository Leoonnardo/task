import 'package:flutter/material.dart';
import 'package:task/screen/home_screen.dart';
import 'package:task/screen/login_screen.dart';
import 'package:task/screen/register_screen.dart';

class AppRoutes {
  static const initialRoute = "HomeScreen";

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({
      'LoginScreen': (BuildContext context) {
        return const LoginScreen();
      }
    });

    appRoutes.addAll({
      'RegisterScreen': (BuildContext context) {
        return const RegisterScreen();
      }
    });

    appRoutes.addAll({
      'HomeScreen': (BuildContext context) {
        return const HomeScreen();
      }
    });

    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'HomeScreen': (BuildContext context) => const HomeScreen(),
  //   'Contador': (BuildContext context) => const HomePage(),
  //   'ListView1': (BuildContext context) => const ListView1Screen(),
  //   'ListView2': (BuildContext context) => const ListView2Screen(),
  // };
}
