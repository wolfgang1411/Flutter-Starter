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

@JsonSerializable(includeIfNull: false)
class UserFilterModel {
  final int page;

  @JsonKey(name: 'itemsPerPage')
  final int itemsPerPage;

  @JsonKey(name: 'searchStr')
  final String? searchStr;

  UserFilterModel({this.page = 1, this.itemsPerPage = 20, this.searchStr});

  factory UserFilterModel.fromJson(Map<String, dynamic> json) =>
      _$UserFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserFilterModelToJson(this);

  /// Helpful copyWith for updates
  UserFilterModel copyWith({int? page, int? itemsPerPage, String? searchStr}) {
    return UserFilterModel(
      page: page ?? this.page,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
      searchStr: searchStr ?? this.searchStr,
    );
  }
}
