import 'package:flutter/material.dart';
import 'package:invoice_builder/core/models/user.model.dart';
import 'package:invoice_builder/core/services/user_service.dart';
import 'package:invoice_builder/features/auth/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final UserService _userService = UserService();

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  UserModel? _loggedInUser;
  UserModel? get loggedInUser => _loggedInUser;
  void setLoggedInUser(UserModel? user) {
    _loggedInUser = user;
    notifyListeners();
  }

  AuthProvider() {
    checkAuth();
  }

  Future<void> checkAuth() async {
    _isLoading = true;
    notifyListeners();
    _isAuthenticated = await _authService.isTokenValid();
    _isLoading = false;

    if (_isAuthenticated) {
      final user = await _userService.whoAmI();
      _loggedInUser = user;
    }
    notifyListeners();
  }

  Future<void> login(String token) async {
    await _authService.saveToken(token);
    _isAuthenticated = true;
    final user = await _userService.whoAmI();
    _loggedInUser = user;
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.deleteToken();
    _isAuthenticated = false;
    notifyListeners();
  }
}
