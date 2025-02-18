// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductListModel _$ProductListModelFromJson(Map<String, dynamic> json) {
  return _ProductListModel.fromJson(json);
}

/// @nodoc
mixin _$ProductListModel {
  @JsonKey(name: "items")
  List<ProductListItem>? get items => throw _privateConstructorUsedError;
  @JsonKey(name: "nextCursor")
  String? get nextCursor => throw _privateConstructorUsedError;

  /// Serializes this ProductListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductListModelCopyWith<ProductListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductListModelCopyWith<$Res> {
  factory $ProductListModelCopyWith(
          ProductListModel value, $Res Function(ProductListModel) then) =
      _$ProductListModelCopyWithImpl<$Res, ProductListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "items") List<ProductListItem>? items,
      @JsonKey(name: "nextCursor") String? nextCursor});
}

/// @nodoc
class _$ProductListModelCopyWithImpl<$Res, $Val extends ProductListModel>
    implements $ProductListModelCopyWith<$Res> {
  _$ProductListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? nextCursor = freezed,
  }) {
    return _then(_value.copyWith(
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProductListItem>?,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductListModelImplCopyWith<$Res>
    implements $ProductListModelCopyWith<$Res> {
  factory _$$ProductListModelImplCopyWith(_$ProductListModelImpl value,
          $Res Function(_$ProductListModelImpl) then) =
      __$$ProductListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "items") List<ProductListItem>? items,
      @JsonKey(name: "nextCursor") String? nextCursor});
}

/// @nodoc
class __$$ProductListModelImplCopyWithImpl<$Res>
    extends _$ProductListModelCopyWithImpl<$Res, _$ProductListModelImpl>
    implements _$$ProductListModelImplCopyWith<$Res> {
  __$$ProductListModelImplCopyWithImpl(_$ProductListModelImpl _value,
      $Res Function(_$ProductListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? nextCursor = freezed,
  }) {
    return _then(_$ProductListModelImpl(
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProductListItem>?,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductListModelImpl implements _ProductListModel {
  const _$ProductListModelImpl(
      {@JsonKey(name: "items") final List<ProductListItem>? items,
      @JsonKey(name: "nextCursor") this.nextCursor})
      : _items = items;

  factory _$ProductListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductListModelImplFromJson(json);

  final List<ProductListItem>? _items;
  @override
  @JsonKey(name: "items")
  List<ProductListItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "nextCursor")
  final String? nextCursor;

  @override
  String toString() {
    return 'ProductListModel(items: $items, nextCursor: $nextCursor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductListModelImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), nextCursor);

  /// Create a copy of ProductListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductListModelImplCopyWith<_$ProductListModelImpl> get copyWith =>
      __$$ProductListModelImplCopyWithImpl<_$ProductListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductListModelImplToJson(
      this,
    );
  }
}

abstract class _ProductListModel implements ProductListModel {
  const factory _ProductListModel(
          {@JsonKey(name: "items") final List<ProductListItem>? items,
          @JsonKey(name: "nextCursor") final String? nextCursor}) =
      _$ProductListModelImpl;

  factory _ProductListModel.fromJson(Map<String, dynamic> json) =
      _$ProductListModelImpl.fromJson;

  @override
  @JsonKey(name: "items")
  List<ProductListItem>? get items;
  @override
  @JsonKey(name: "nextCursor")
  String? get nextCursor;

  /// Create a copy of ProductListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductListModelImplCopyWith<_$ProductListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductListItem _$ProductListItemFromJson(Map<String, dynamic> json) {
  return _ProductListItem.fromJson(json);
}

/// @nodoc
mixin _$ProductListItem {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  @IntToDoubleConverter()
  double? get price => throw _privateConstructorUsedError;

  /// Serializes this ProductListItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductListItemCopyWith<ProductListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductListItemCopyWith<$Res> {
  factory $ProductListItemCopyWith(
          ProductListItem value, $Res Function(ProductListItem) then) =
      _$ProductListItemCopyWithImpl<$Res, ProductListItem>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "price") @IntToDoubleConverter() double? price});
}

/// @nodoc
class _$ProductListItemCopyWithImpl<$Res, $Val extends ProductListItem>
    implements $ProductListItemCopyWith<$Res> {
  _$ProductListItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductListItem
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
abstract class _$$ProductListItemImplCopyWith<$Res>
    implements $ProductListItemCopyWith<$Res> {
  factory _$$ProductListItemImplCopyWith(_$ProductListItemImpl value,
          $Res Function(_$ProductListItemImpl) then) =
      __$$ProductListItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "price") @IntToDoubleConverter() double? price});
}

/// @nodoc
class __$$ProductListItemImplCopyWithImpl<$Res>
    extends _$ProductListItemCopyWithImpl<$Res, _$ProductListItemImpl>
    implements _$$ProductListItemImplCopyWith<$Res> {
  __$$ProductListItemImplCopyWithImpl(
      _$ProductListItemImpl _value, $Res Function(_$ProductListItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductListItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
  }) {
    return _then(_$ProductListItemImpl(
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
class _$ProductListItemImpl implements _ProductListItem {
  const _$ProductListItemImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "price") @IntToDoubleConverter() this.price});

  factory _$ProductListItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductListItemImplFromJson(json);

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
    return 'ProductListItem(id: $id, name: $name, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductListItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price);

  /// Create a copy of ProductListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductListItemImplCopyWith<_$ProductListItemImpl> get copyWith =>
      __$$ProductListItemImplCopyWithImpl<_$ProductListItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductListItemImplToJson(
      this,
    );
  }
}

abstract class _ProductListItem implements ProductListItem {
  const factory _ProductListItem(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "price")
      @IntToDoubleConverter()
      final double? price}) = _$ProductListItemImpl;

  factory _ProductListItem.fromJson(Map<String, dynamic> json) =
      _$ProductListItemImpl.fromJson;

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

  /// Create a copy of ProductListItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductListItemImplCopyWith<_$ProductListItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
