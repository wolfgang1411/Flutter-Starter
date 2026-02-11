import 'package:flutter/material.dart';
import 'package:invoice_builder/features/auth/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  AuthProvider() {
    checkAuth();
  }

  Future<void> checkAuth() async {
    _isLoading = true;
    notifyListeners();

    _isAuthenticated = await _authService.isTokenValid();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> login(String token) async {
    await _authService.saveToken(token);
    _isAuthenticated = true;
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.deleteToken();
    _isAuthenticated = false;
    notifyListeners();
  }
}
