import '../../entities/orders/user_order.dart';

abstract class ManageUserOrdersUsecase {
  Future<List<UserOrder>> loadOrders();
  Future<void> saveOrders(List<UserOrder> orders);
  List<UserOrder> addOrder(List<UserOrder> currentOrders, UserOrder order);
  List<UserOrder> updateOrder(
      List<UserOrder> currentOrders, int productId, int quantity);
  List<UserOrder> removeOrder(List<UserOrder> currentOrders, int productId);
  Future<void> clearOrders();
}
