import 'package:flutter/material.dart';
import 'package:invoice_builder/shared/layout/app_scaffold.dart';
import 'package:invoice_builder/shared/layout/page_center.dart';
import 'package:invoice_builder/shared/widgets/app_input.dart';
import "package:invoice_builder/shared/utils/validators.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: PageCenter(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              AppInputField(
                label: 'Email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: Validators.email,
              ),
              AppInputField(
                label: 'Password',
                controller: _passwordController,
                obscureText: true,
                validator: Validators.min(6),
              ),
              ElevatedButton(onPressed: _submit, child: const Text('Login')),
            ],
          ),
        ),
      ),
    );
  }
}
