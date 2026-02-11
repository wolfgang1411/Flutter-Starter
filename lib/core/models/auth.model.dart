abstract class AuthTokenRequest {
  String get username;
  String get password;
  String get grant_type;
}

class AuthTokenRequestModel implements AuthTokenRequest {
  @override
  final String username;

  @override
  final String password;

  @override
  final String grant_type;

  AuthTokenRequestModel({
    required this.username,
    required this.password,
    this.grant_type = 'password',
  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
    'grant_type': grant_type,
  };
}

abstract class AuthTokenResponse {
  String get access_token;
  String get refresh_token;
  int get expires_in;
  String get type;
}

class AuthTokenResponseModel implements AuthTokenResponse {
  @override
  final String access_token;

  @override
  final String refresh_token;

  @override
  final int expires_in;

  @override
  final String type;

  AuthTokenResponseModel({
    required this.access_token,
    required this.refresh_token,
    required this.expires_in,
    required this.type,
  });

  factory AuthTokenResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthTokenResponseModel(
      access_token: json['access_token'],
      refresh_token: json['refresh_token'],
      expires_in: json['expires_in'],
      type: json['type'],
    );
  }
}

abstract class TokenInfo {
  int get sub;
  String get username;
  int get iat;
  int get exp;
}

class TokenInfoModel implements TokenInfo {
  @override
  final int sub;

  @override
  final String username;

  @override
  final int iat;

  @override
  final int exp;

  TokenInfoModel({
    required this.sub,
    required this.username,
    required this.iat,
    required this.exp,
  });

  factory TokenInfoModel.fromJson(Map<String, dynamic> json) {
    return TokenInfoModel(
      sub: json['sub'],
      username: json['username'],
      iat: json['iat'],
      exp: json['exp'],
    );
  }
}
