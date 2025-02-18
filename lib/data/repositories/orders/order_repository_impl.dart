import 'package:shoppings_app/data/datasource/order_datasource.dart';
import 'package:shoppings_app/data/repositories/orders/order_repository.dart';
import 'package:shoppings_app/domain/entities/orders/user_order.dart';

class OrderRepositoryImpl extends OrderRepository {
  final OrderDatasource _datasource;
  OrderRepositoryImpl(this._datasource);

  @override
  Future<List<UserOrder>> getUserOrders() {
    return _datasource.getUserOrders();
  }

  @override
  Future<void> saveUserOrders(List<UserOrder> orders) {
    return _datasource.saveUserOrders(orders);
  }

  @override
  Future<void> sendOrder(List<UserOrder> orders) async {
    final result = await _datasource.sendOrder(orders);
    return result.fold(
      (appException) {
        throw appException;
      },
      (data) => data,
    );
  }
}
