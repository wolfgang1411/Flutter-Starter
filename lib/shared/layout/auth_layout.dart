import 'package:flutter/material.dart';
// import 'package:invoice_builder/core/state/auth_state.dart';
import 'package:invoice_builder/shared/layout/app_scaffold.dart';
// import 'package:provider/provider.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // final authState = context.watch<AuthProvider>();

    return AppScaffold(body: child);
  }
}
