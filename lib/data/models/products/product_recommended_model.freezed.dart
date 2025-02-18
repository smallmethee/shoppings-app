// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_recommended_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductRecommendedModel _$ProductRecommendedModelFromJson(
    Map<String, dynamic> json) {
  return _ProductRecommendedModel.fromJson(json);
}

/// @nodoc
mixin _$ProductRecommendedModel {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  @IntToDoubleConverter()
  double? get price => throw _privateConstructorUsedError;

  /// Serializes this ProductRecommendedModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductRecommendedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductRecommendedModelCopyWith<ProductRecommendedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductRecommendedModelCopyWith<$Res> {
  factory $ProductRecommendedModelCopyWith(ProductRecommendedModel value,
          $Res Function(ProductRecommendedModel) then) =
      _$ProductRecommendedModelCopyWithImpl<$Res, ProductRecommendedModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "price") @IntToDoubleConverter() double? price});
}

/// @nodoc
class _$ProductRecommendedModelCopyWithImpl<$Res,
        $Val extends ProductRecommendedModel>
    implements $ProductRecommendedModelCopyWith<$Res> {
  _$ProductRecommendedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductRecommendedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductRecommendedModelImplCopyWith<$Res>
    implements $ProductRecommendedModelCopyWith<$Res> {
  factory _$$ProductRecommendedModelImplCopyWith(
          _$ProductRecommendedModelImpl value,
          $Res Function(_$ProductRecommendedModelImpl) then) =
      __$$ProductRecommendedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "price") @IntToDoubleConverter() double? price});
}

/// @nodoc
class __$$ProductRecommendedModelImplCopyWithImpl<$Res>
    extends _$ProductRecommendedModelCopyWithImpl<$Res,
        _$ProductRecommendedModelImpl>
    implements _$$ProductRecommendedModelImplCopyWith<$Res> {
  __$$ProductRecommendedModelImplCopyWithImpl(
      _$ProductRecommendedModelImpl _value,
      $Res Function(_$ProductRecommendedModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRecommendedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
  }) {
    return _then(_$ProductRecommendedModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductRecommendedModelImpl implements _ProductRecommendedModel {
  const _$ProductRecommendedModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "price") @IntToDoubleConverter() this.price});

  factory _$ProductRecommendedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductRecommendedModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "price")
  @IntToDoubleConverter()
  final double? price;

  @override
  String toString() {
    return 'ProductRecommendedModel(id: $id, name: $name, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductRecommendedModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price);

  /// Create a copy of ProductRecommendedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductRecommendedModelImplCopyWith<_$ProductRecommendedModelImpl>
      get copyWith => __$$ProductRecommendedModelImplCopyWithImpl<
          _$ProductRecommendedModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductRecommendedModelImplToJson(
      this,
    );
  }
}

abstract class _ProductRecommendedModel implements ProductRecommendedModel {
  const factory _ProductRecommendedModel(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "price")
      @IntToDoubleConverter()
      final double? price}) = _$ProductRecommendedModelImpl;

  factory _ProductRecommendedModel.fromJson(Map<String, dynamic> json) =
      _$ProductRecommendedModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "price")
  @IntToDoubleConverter()
  double? get price;

  /// Create a copy of ProductRecommendedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductRecommendedModelImplCopyWith<_$ProductRecommendedModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
