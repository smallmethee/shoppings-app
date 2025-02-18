// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductListModelImpl _$$ProductListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductListModelImpl(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ProductListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextCursor: json['nextCursor'] as String?,
    );

Map<String, dynamic> _$$ProductListModelImplToJson(
        _$ProductListModelImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'nextCursor': instance.nextCursor,
    };

_$ProductListItemImpl _$$ProductListItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductListItemImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: const IntToDoubleConverter().fromJson(json['price']),
    );

Map<String, dynamic> _$$ProductListItemImplToJson(
        _$ProductListItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': const IntToDoubleConverter().toJson(instance.price),
    };
