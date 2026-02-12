import 'package:invoice_builder/core/models/pagination.model.dart';
import 'package:invoice_builder/core/models/user.model.dart';
import 'package:invoice_builder/core/network/api_client.dart';

class UserService {
  final ApiClient _apiClient = ApiClient();

  Future whoAmI() async {
    final response = await _apiClient.get("auth/whoami");
    return UserModel.fromJson(response.data);
  }

  Future<PaginatedResponse<UserModel>> fetchUsers(
    UserFilterModel filter,
  ) async {
    final response = await _apiClient.get(
      "users",
      queryParameters: filter.toJson(),
    );
    return PaginatedResponse<UserModel>.fromJson(
      response.data,
      (json) => UserModel.fromJson(json as Map<String, dynamic>),
    );
  }
}
