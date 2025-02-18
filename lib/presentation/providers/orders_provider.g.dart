// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$orderRepoImplHash() => r'b467d7c258cbdb5baeea19b48134392e123975f2';

/// See also [orderRepoImpl].
@ProviderFor(orderRepoImpl)
final orderRepoImplProvider = AutoDisposeProvider<OrderRepositoryImpl>.internal(
  orderRepoImpl,
  name: r'orderRepoImplProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$orderRepoImplHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OrderRepoImplRef = AutoDisposeProviderRef<OrderRepositoryImpl>;
String _$checkOutOrderHash() => r'75d410610c261cc3b191c45331c4b6c501443aad';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [checkOutOrder].
@ProviderFor(checkOutOrder)
const checkOutOrderProvider = CheckOutOrderFamily();

/// See also [checkOutOrder].
class CheckOutOrderFamily extends Family<AsyncValue<void>> {
  /// See also [checkOutOrder].
  const CheckOutOrderFamily();

  /// See also [checkOutOrder].
  CheckOutOrderProvider call(
    List<UserOrder> orders,
  ) {
    return CheckOutOrderProvider(
      orders,
    );
  }

  @override
  CheckOutOrderProvider getProviderOverride(
    covariant CheckOutOrderProvider provider,
  ) {
    return call(
      provider.orders,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'checkOutOrderProvider';
}

/// See also [checkOutOrder].
class CheckOutOrderProvider extends AutoDisposeFutureProvider<void> {
  /// See also [checkOutOrder].
  CheckOutOrderProvider(
    List<UserOrder> orders,
  ) : this._internal(
          (ref) => checkOutOrder(
            ref as CheckOutOrderRef,
            orders,
          ),
          from: checkOutOrderProvider,
          name: r'checkOutOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checkOutOrderHash,
          dependencies: CheckOutOrderFamily._dependencies,
          allTransitiveDependencies:
              CheckOutOrderFamily._allTransitiveDependencies,
          orders: orders,
        );

  CheckOutOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.orders,
  }) : super.internal();

  final List<UserOrder> orders;

  @override
  Override overrideWith(
    FutureOr<void> Function(CheckOutOrderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CheckOutOrderProvider._internal(
        (ref) => create(ref as CheckOutOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        orders: orders,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CheckOutOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckOutOrderProvider && other.orders == orders;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orders.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CheckOutOrderRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `orders` of this provider.
  List<UserOrder> get orders;
}

class _CheckOutOrderProviderElement
    extends AutoDisposeFutureProviderElement<void> with CheckOutOrderRef {
  _CheckOutOrderProviderElement(super.provider);

  @override
  List<UserOrder> get orders => (origin as CheckOutOrderProvider).orders;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
