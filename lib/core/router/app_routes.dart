import 'package:flutter/material.dart';
import 'package:invoice_builder/features/auth/auth_page.dart';
import 'package:invoice_builder/features/home/home_page.dart';
import 'package:invoice_builder/shared/layout/auth_wrapper.dart'; // add this

class AppRoutes {
  static const String home = '/';
  static const String invoice = '/invoice';
  static const String auth = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const AuthWrapper(child: HomePage()),
        );
      case auth:
        return MaterialPageRoute(builder: (_) => LoginPage());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
