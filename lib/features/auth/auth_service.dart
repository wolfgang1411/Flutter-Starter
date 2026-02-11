import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:invoice_builder/core/models/auth.model.dart';
import 'package:invoice_builder/core/network/api_client.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthService {
  final _storage = const FlutterSecureStorage();
  final ApiClient _apiClient = ApiClient();
  static const _tokenKey = 'auth_token';

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  Future<bool> isTokenValid() async {
    final token = await getToken();
    if (token == null || token.isEmpty) return false;

    if (JwtDecoder.isExpired(token)) {
      await deleteToken();
      return false;
    }

    return true;
  }

  Future<AuthTokenResponse> loginWithEmail(AuthTokenRequest data) async {
    final response = await _apiClient.post('auth/token', data.toJson());
    return AuthTokenResponse.fromJson(response.data);
  }
}
