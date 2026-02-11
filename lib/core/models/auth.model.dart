import 'package:json_annotation/json_annotation.dart';

part 'auth.model.g.dart';

@JsonSerializable()
class AuthTokenRequest {
  final String username;
  final String password;

  @JsonKey(name: 'grant_type')
  final String grantType;

  AuthTokenRequest({
    required this.username,
    required this.password,
    this.grantType = 'password',
  });

  factory AuthTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenRequestToJson(this);
}

@JsonSerializable()
class AuthTokenResponse {
  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @JsonKey(name: 'expires_in')
  final int expiresIn;

  final String type;

  AuthTokenResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.type,
  });

  factory AuthTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenResponseToJson(this);
}
