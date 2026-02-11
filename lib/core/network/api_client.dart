import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:invoice_builder/core/config/env.dart';
import 'package:invoice_builder/core/network/api_exception.dart';

class ApiClient {
  late final Dio _dio;
  static const _tokenKey = 'auth_token';

  ApiClient() {
    final tokenStorage = const FlutterSecureStorage();

    _dio = Dio(
      BaseOptions(
        baseUrl: Env.apiBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await tokenStorage.read(key: _tokenKey);

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            await tokenStorage.delete(key: _tokenKey);
          }

          return handler.next(error);
        },
      ),
    );
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get<T>(path, queryParameters: queryParameters);
  }

  Future<Response<T>> post<T>(
    String path,
    dynamic data, {
    Options? options,
  }) async {
    try {
      return await _dio.post<T>(path, data: data, options: options);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response<T>> put<T>(String path, dynamic data) async {
    return await _dio.put<T>(path, data: data);
  }

  Future<Response<T>> patch<T>(String path, dynamic data) async {
    return await _dio.patch<T>(path, data: data);
  }

  Future<Response<T>> delete<T>(String path, {dynamic data}) async {
    return await _dio.delete<T>(path, data: data);
  }

  ApiException _handleDioError(DioException e) {
    if (e.response != null) {
      final statusCode = e.response?.statusCode;

      final data = e.response?.data;

      String message = 'Something went wrong';

      if (data is Map && data['error_description'] != null) {
        message = data['error_description'];
      } else if (data is Map && data['message'] != null) {
        message = data['message'];
      }

      return ApiException(message: message, statusCode: statusCode);
    }

    return ApiException(
      message: 'Network error. Please check your connection.',
    );
  }
}
