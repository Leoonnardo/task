import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/taskBloc/task_bloc_bloc.dart';
import 'package:task/router/app_routes.dart';
import 'package:task/widget/global_text.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(
        create: (_) => TaskBlocBloc())],
      child: const MyApp()
    );
  }
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
