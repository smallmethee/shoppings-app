import 'package:shoppings_app/data/repositories/orders/order_repository.dart';
import 'package:shoppings_app/domain/usecases/orders/manage_user_orders_usecase.dart';
import '../../entities/orders/user_order.dart';

class ManageUserOrders implements ManageUserOrdersUsecase {
  final OrderRepository _orderRepository;
  ManageUserOrders(this._orderRepository);

  @override
  Future<List<UserOrder>> loadOrders() async {
    return await _orderRepository.getUserOrders();
  }

  @override
  Future<void> saveOrders(List<UserOrder> orders) async {
    await _orderRepository.saveUserOrders(orders);
  }

  @override
  List<UserOrder> addOrder(List<UserOrder> currentOrders, UserOrder order) {
    final updatedOrders = [...currentOrders, order];
    saveOrders(updatedOrders);
    return updatedOrders;
  }

  @override
  List<UserOrder> updateOrder(
      List<UserOrder> currentOrders, int productId, int quantity) {
    final updatedOrders = currentOrders.map((order) {
      return order.productId == productId
          ? order.copyWith(quantity: quantity)
          : order;
    }).toList();
    saveOrders(updatedOrders);
    return updatedOrders;
  }

  @override
  List<UserOrder> removeOrder(List<UserOrder> currentOrders, int productId) {
    final updatedOrders =
        currentOrders.where((order) => order.productId != productId).toList();
    saveOrders(updatedOrders);
    return updatedOrders;
  }

  @override
  Future<void> clearOrders() async {
    await saveOrders([]);
  }
}
