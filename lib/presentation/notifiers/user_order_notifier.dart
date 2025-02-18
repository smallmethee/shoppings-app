import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoppings_app/domain/entities/orders/order_summary.dart';
import 'package:shoppings_app/domain/entities/orders/user_order.dart';
import 'package:shoppings_app/domain/usecases/orders/manage_user_orders.dart';
import 'package:shoppings_app/domain/usecases/orders/order_summary.dart';
import 'package:shoppings_app/presentation/providers/orders_provider.dart';

part 'user_order_notifier.g.dart';

@riverpod
ManageUserOrders manageUserOrders(Ref ref) {
  final repository = ref.watch(orderRepoImplProvider);
  return ManageUserOrders(repository);
}

@riverpod
class UserOrderController extends _$UserOrderController {
  @override
  Future<List<UserOrder>> build() async {
    final manageUserOrders = ref.watch(manageUserOrdersProvider);
    return manageUserOrders.loadOrders();
  }

  Future<void> loadOrders() async {
    final manageUserOrders = ref.read(manageUserOrdersProvider);
    state = await AsyncValue.guard(() => manageUserOrders.loadOrders());
  }

  void addOrder(UserOrder order) {
    final manageUserOrders = ref.read(manageUserOrdersProvider);
    state =
        state.whenData((orders) => manageUserOrders.addOrder(orders, order));
  }

  void updateOrder(int productId, int quantity) {
    final manageUserOrders = ref.read(manageUserOrdersProvider);
    state = state.whenData(
        (orders) => manageUserOrders.updateOrder(orders, productId, quantity));
  }

  void increaseQuantity(int productId) {
    final manageUserOrders = ref.read(manageUserOrdersProvider);
    state = state.whenData((orders) => manageUserOrders.updateOrder(
        orders,
        productId,
        (orders.firstWhere((order) => order.productId == productId).quantity +
            1)));
  }

  void decreaseQuantity(int productId) {
    final manageUserOrders = ref.read(manageUserOrdersProvider);
    state = state.whenData((orders) {
      final currentQuantity =
          orders.firstWhere((order) => order.productId == productId).quantity;
      if (currentQuantity > 1) {
        return manageUserOrders.updateOrder(
            orders, productId, currentQuantity - 1);
      }
      return orders;
    });
  }

  void removeOrder(int productId) {
    final manageUserOrders = ref.read(manageUserOrdersProvider);
    state = state
        .whenData((orders) => manageUserOrders.removeOrder(orders, productId));
  }

  Future<void> clearOrders() async {
    final manageUserOrders = ref.read(manageUserOrdersProvider);
    await manageUserOrders.clearOrders();
    state = const AsyncValue.data([]);
  }
}

@riverpod
class OrderSummaryNotifier extends _$OrderSummaryNotifier {
  @override
  OrderSummary build() {
    final userOrders = ref.watch(userOrderControllerProvider);
    return userOrders.when(
      data: (orders) => CalculateOrderSummary().execute(orders),
      loading: () => state,
      error: (_, __) => state,
    );
  }
}
