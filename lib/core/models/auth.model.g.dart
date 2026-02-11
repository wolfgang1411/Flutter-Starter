// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokenRequest _$AuthTokenRequestFromJson(Map<String, dynamic> json) =>
    AuthTokenRequest(
      username: json['username'] as String,
      password: json['password'] as String,
      grantType: json['grant_type'] as String? ?? 'password',
    );

Map<String, dynamic> _$AuthTokenRequestToJson(AuthTokenRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'grant_type': instance.grantType,
    };

AuthTokenResponse _$AuthTokenResponseFromJson(Map<String, dynamic> json) =>
    AuthTokenResponse(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
      type: json['type'] as String,
    );

Map<String, dynamic> _$AuthTokenResponseToJson(AuthTokenResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'type': instance.type,
    };
