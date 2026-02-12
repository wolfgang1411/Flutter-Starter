// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String,
  fullName: json['fullName'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  active: json['active'] as bool,
  status: json['status'] as String,
  accessLevel: json['accessLevel'] as String,
  isEmailVerified: json['isEmailVerified'] as bool,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'fullName': instance.fullName,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'active': instance.active,
  'status': instance.status,
  'accessLevel': instance.accessLevel,
  'isEmailVerified': instance.isEmailVerified,
};

UserFilterModel _$UserFilterModelFromJson(Map<String, dynamic> json) =>
    UserFilterModel(
      page: (json['page'] as num?)?.toInt() ?? 1,
      itemsPerPage: (json['itemsPerPage'] as num?)?.toInt() ?? 20,
      searchStr: json['searchStr'] as String?,
    );

Map<String, dynamic> _$UserFilterModelToJson(UserFilterModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'itemsPerPage': instance.itemsPerPage,
      'searchStr': ?instance.searchStr,
    };
