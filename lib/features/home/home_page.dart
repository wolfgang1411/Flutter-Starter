import 'package:flutter/material.dart';
import 'package:invoice_builder/shared/layout/app_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: Center(child: Text('Home page')));
  }
}
