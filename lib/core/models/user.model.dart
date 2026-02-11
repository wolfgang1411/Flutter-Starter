import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String email;
  final String fullName;
  final String firstName;
  final String lastName;
  final bool active;
  final String status;
  final String accessLevel;
  final bool isEmailVerified;

  UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.active,
    required this.status,
    required this.accessLevel,
    required this.isEmailVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
