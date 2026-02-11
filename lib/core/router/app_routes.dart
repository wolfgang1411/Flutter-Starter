import 'package:flutter/material.dart';
import 'package:invoice_builder/features/auth/auth_page.dart';
import 'package:invoice_builder/features/home/home_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String invoice = '/invoice';
  static const String auth = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case auth:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
