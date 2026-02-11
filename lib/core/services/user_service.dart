import 'package:invoice_builder/core/models/user.model.dart';
import 'package:invoice_builder/core/network/api_client.dart';

class UserService {
  final ApiClient _apiClient = ApiClient();

  Future whoAmI() async {
    final response = await _apiClient.get("auth/whoami");
    return UserModel.fromJson(response.data);
  }
}
