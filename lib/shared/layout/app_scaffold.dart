import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:invoice_builder/core/state/app_state.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;

  const AppScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();

    return Scaffold(
      appBar: AppBar(title: Text(appProvider.title)),
      body: body,
    );
  }
}
