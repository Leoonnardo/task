import 'package:flutter/material.dart';
import 'package:task/router/app_routes.dart';
import 'package:task/widget/global_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final menu = Menu();
    return MaterialApp(
      title: menu.titleApp,
      initialRoute: menu.initialRoute,
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.getAppRoutes(),
    );
  }
}
