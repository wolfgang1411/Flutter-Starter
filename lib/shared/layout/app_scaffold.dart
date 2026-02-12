import 'package:flutter/material.dart';
import 'package:invoice_builder/core/state/auth_state.dart';
import 'package:provider/provider.dart';
import 'package:invoice_builder/core/state/app_state.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;

  const AppScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(appProvider.title),
        actions: authProvider.isAuthenticated
            ? [
                IconButton(
                  onPressed: () => authProvider.logout(),
                  icon: Icon(Icons.logout),
                ),
              ]
            : [],
      ),
      body: body,
    );
  }
}
