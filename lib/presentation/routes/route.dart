import 'package:clean_architecture/presentation/views/detail/detail.dart';
import 'package:clean_architecture/presentation/views/home/home.dart';
import 'package:clean_architecture/presentation/views/login/login.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static String home = "/home";
  static String detail = "/detail";
  static String login = "/login";
}

abstract class AppRoute {
  static String initial = Routes.home;
  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.home: (context) => const HomePage(),
    Routes.detail: (context) => const DetailPage(),
    Routes.login: (context) => const LoginPage(),
  };
}
