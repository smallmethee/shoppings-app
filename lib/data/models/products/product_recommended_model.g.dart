// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_recommended_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductRecommendedModelImpl _$$ProductRecommendedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductRecommendedModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: const IntToDoubleConverter().fromJson(json['price']),
    );

Map<String, dynamic> _$$ProductRecommendedModelImplToJson(
        _$ProductRecommendedModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': const IntToDoubleConverter().toJson(instance.price),
    };
