import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoppings_app/shared/utils/freezed_converter.dart';

part 'product_list_model.freezed.dart';
part 'product_list_model.g.dart';

@freezed
class ProductListModel with _$ProductListModel {
  const factory ProductListModel({
    @JsonKey(name: "items") List<ProductListItem>? items,
    @JsonKey(name: "nextCursor") String? nextCursor,
  }) = _ProductListModel;

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      _$ProductListModelFromJson(json);
}

@freezed
class ProductListItem with _$ProductListItem {
  const factory ProductListItem({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "price") @IntToDoubleConverter() double? price,
  }) = _ProductListItem;

  factory ProductListItem.fromJson(Map<String, dynamic> json) =>
      _$ProductListItemFromJson(json);
}
