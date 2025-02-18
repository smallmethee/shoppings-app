// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_order_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$manageUserOrdersHash() => r'3f0d10704f38569bf8f49964e0dc91c857182f50';

/// See also [manageUserOrders].
@ProviderFor(manageUserOrders)
final manageUserOrdersProvider = AutoDisposeProvider<ManageUserOrders>.internal(
  manageUserOrders,
  name: r'manageUserOrdersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$manageUserOrdersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ManageUserOrdersRef = AutoDisposeProviderRef<ManageUserOrders>;
String _$userOrderControllerHash() =>
    r'3f7b28b0c054ca0178c962e8394b002ec45498ce';

/// See also [UserOrderController].
@ProviderFor(UserOrderController)
final userOrderControllerProvider = AutoDisposeAsyncNotifierProvider<
    UserOrderController, List<UserOrder>>.internal(
  UserOrderController.new,
  name: r'userOrderControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userOrderControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserOrderController = AutoDisposeAsyncNotifier<List<UserOrder>>;
String _$orderSummaryNotifierHash() =>
    r'a282811ba38b53ce3b0d72be6a7106924084143a';

/// See also [OrderSummaryNotifier].
@ProviderFor(OrderSummaryNotifier)
final orderSummaryNotifierProvider =
    AutoDisposeNotifierProvider<OrderSummaryNotifier, OrderSummary>.internal(
  OrderSummaryNotifier.new,
  name: r'orderSummaryNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$orderSummaryNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OrderSummaryNotifier = AutoDisposeNotifier<OrderSummary>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
