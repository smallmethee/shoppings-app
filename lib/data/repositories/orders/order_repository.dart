import 'package:shoppings_app/domain/entities/orders/user_order.dart';

abstract class OrderRepository {
  Future<void> saveUserOrders(List<UserOrder> orders);
  Future<List<UserOrder>> getUserOrders();
  Future<void> sendOrder(List<UserOrder> orders);
}
