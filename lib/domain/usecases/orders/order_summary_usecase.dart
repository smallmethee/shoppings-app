import 'package:shoppings_app/domain/entities/orders/order_summary.dart';
import 'package:shoppings_app/domain/entities/orders/user_order.dart';

abstract class OrderSummaryUseCase {
  OrderSummary execute(List<UserOrder> userOrders);
}
