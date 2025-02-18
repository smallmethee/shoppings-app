import 'package:shoppings_app/domain/entities/orders/order_summary.dart';
import 'package:shoppings_app/domain/entities/orders/user_order.dart';
import 'package:shoppings_app/domain/usecases/orders/order_summary_usecase.dart';

class CalculateOrderSummary implements OrderSummaryUseCase {
  static const double _discountRate = 0.05;
  @override
  OrderSummary execute(List<UserOrder> userOrders) {
    double subtotal = 0;
    double discount = 0;

    for (var order in userOrders) {
      double itemTotal = order.price * order.quantity;
      subtotal += itemTotal;

      int discountPairs = order.quantity ~/ 2;
      discount += (order.price * 2 * _discountRate) * discountPairs;
    }

    double total = subtotal - discount;
    return OrderSummary(subtotal: subtotal, discount: discount, total: total);
  }
}
