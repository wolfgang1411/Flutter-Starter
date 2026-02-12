// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedResponse<T> _$PaginatedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PaginatedResponse<T>(
  items: (json['items'] as List<dynamic>).map(fromJsonT).toList(),
  page: (json['page'] as num).toInt(),
  itemsPerPage: (json['itemsPerPage'] as num).toInt(),
  totalCount: (json['totalCount'] as num).toInt(),
);

Map<String, dynamic> _$PaginatedResponseToJson<T>(
  PaginatedResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'items': instance.items.map(toJsonT).toList(),
  'page': instance.page,
  'itemsPerPage': instance.itemsPerPage,
  'totalCount': instance.totalCount,
};
