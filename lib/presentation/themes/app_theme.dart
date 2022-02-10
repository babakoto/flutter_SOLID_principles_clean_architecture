import 'package:flutter/material.dart';

abstract class AppTheme {
  static const Color primaryColor = Color(0XFF78be20);
  static const Color secondaryColor = Colors.grey;
  static ThemeData theme(BuildContext context) => Theme.of(context).copyWith(
      colorScheme: Theme.of(context)
          .colorScheme
          .copyWith(primary: AppTheme.primaryColor),
      textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 14, color: Colors.black),
          bodyText2: TextStyle(fontSize: 14, color: Colors.black),
          headline1: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black54),
          headline2: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black54),
          headline3: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black54),
          headline4: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black54),
          headline5: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black54),
          headline6: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black54)));
}
