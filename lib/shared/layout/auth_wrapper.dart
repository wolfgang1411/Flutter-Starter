import 'package:flutter/material.dart';
import 'package:invoice_builder/core/state/auth_state.dart';
import 'package:invoice_builder/features/auth/auth_page.dart';
import 'package:invoice_builder/features/home/home_page.dart';
import 'package:provider/provider.dart'; // 👈 REQUIRED

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    if (auth.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (auth.isAuthenticated) {
      return HomePage();
    } else {
      return LoginPage();
    }
  }
}
