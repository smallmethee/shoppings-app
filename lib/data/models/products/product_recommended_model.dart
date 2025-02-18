import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoppings_app/shared/utils/freezed_converter.dart';

part 'product_recommended_model.freezed.dart';
part 'product_recommended_model.g.dart';

@freezed
class ProductRecommendedModel with _$ProductRecommendedModel {
  const factory ProductRecommendedModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "price") @IntToDoubleConverter() double? price,
  }) = _ProductRecommendedModel;

  factory ProductRecommendedModel.fromJson(Map<String, dynamic> json) =>
      _$ProductRecommendedModelFromJson(json);
}
