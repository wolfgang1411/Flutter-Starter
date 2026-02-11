import 'package:flutter/material.dart';

class GuestLayout extends StatelessWidget {
  final Widget child;

  const GuestLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: child));
  }
}
