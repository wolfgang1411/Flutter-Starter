import 'package:flutter/material.dart';
import 'package:invoice_builder/core/router/app_routes.dart';
import 'package:invoice_builder/core/state/auth_state.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  final Widget child;

  const AuthWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    if (auth.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (!auth.isAuthenticated) {
      // 👇 Redirect AFTER build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, AppRoutes.auth);
      });

      // Temporary blank screen while redirecting
      return const SizedBox.shrink();
    }

    return child;
  }
}
