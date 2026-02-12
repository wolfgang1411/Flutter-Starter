import 'package:json_annotation/json_annotation.dart';

part 'pagination.model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginatedResponse<T> {
  final List<T> items;

  final int page;

  @JsonKey(name: 'itemsPerPage')
  final int itemsPerPage;

  @JsonKey(name: 'totalCount')
  final int totalCount;

  PaginatedResponse({
    required this.items,
    required this.page,
    required this.itemsPerPage,
    required this.totalCount,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$PaginatedResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$PaginatedResponseToJson(this, toJsonT);
}
