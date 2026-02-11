import 'package:flutter/material.dart';
import 'package:invoice_builder/core/state/auth_state.dart';
import 'package:invoice_builder/shared/layout/app_scaffold.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = context.watch<AuthProvider>();
    final loggedInUser = authProvider.loggedInUser;

    return AppScaffold(
      body: Center(child: Text('Home page ${loggedInUser?.firstName}')),
    );
  }
}
