import 'package:clean_architecture/presentation/pages/detail/detail.dart';
import 'package:clean_architecture/presentation/pages/home/home.dart';
import 'package:clean_architecture/presentation/pages/login/login.dart';
import 'package:clean_architecture/presentation/pages/notfound/not_found_page.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static String home = "/home";
  static String detail = "/detail";
  static String login = "/login";
  static String notFound = "/notFound";
}

abstract class AppRoute {
  static String initial = Routes.home;
  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.home: (context) => const HomePage(),
    Routes.detail: (context) => const DetailPage(),
    Routes.login: (context) => const LoginPage(),
    Routes.notFound: (context) => const NotFound()
  };
}
