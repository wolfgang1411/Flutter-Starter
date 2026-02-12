import 'package:flutter/material.dart';
import 'package:invoice_builder/core/constants/app_assets.dart';
import 'package:invoice_builder/core/models/models.dart';
import 'package:invoice_builder/core/network/api_exception.dart';
import 'package:invoice_builder/core/state/auth_state.dart';
import 'package:invoice_builder/features/auth/auth_service.dart';
import 'package:invoice_builder/shared/layout/app_scaffold.dart';
import 'package:invoice_builder/shared/layout/page_center.dart';
import 'package:invoice_builder/shared/utils/app_snackbar.dart';
import 'package:invoice_builder/shared/utils/crypto.dart';
import 'package:invoice_builder/shared/widgets/app_input.dart';
import "package:invoice_builder/shared/utils/validators.dart";
import 'package:invoice_builder/shared/widgets/app_submit_button.dart';
import "package:provider/provider.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var _isLoading = false;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      setState(() {
        _isLoading = true;
      });
      final request = AuthTokenRequest(
        username: _emailController.text.trim(),
        password: generateMd5(_passwordController.text.trim()),
      );

      final response = await _authService.loginWithEmail(request);

      if (!mounted) return;
      context.read<AuthProvider>().login(response.accessToken);
    } on ApiException catch (e) {
      if (!mounted) return;
      AppSnackbar.show(context, e.message);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
              Image.asset(AppAssets.logo),
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
              // ElevatedButton(onPressed: _submit, child: const Text('Login')),
              SubmitButton(
                text: 'Login',
                loadingText: 'Please wait',
                isLoading: _isLoading,
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
