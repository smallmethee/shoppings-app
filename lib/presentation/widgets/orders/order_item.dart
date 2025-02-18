import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppings_app/domain/entities/orders/user_order.dart';
import 'package:shoppings_app/presentation/notifiers/user_order_notifier.dart';
import 'package:shoppings_app/shared/widgets/products/product_item.dart';

class OrderItem extends HookConsumerWidget {
  const OrderItem({
    super.key,
    required this.order,
  });
  final UserOrder order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userOrderNotifier = ref.read(userOrderControllerProvider.notifier);

    return Dismissible(
      key: Key(order.productId.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        userOrderNotifier.removeOrder(order.productId);
      },
      child: ProductItem(
        name: order.name,
        price: order.price,
        action: QuantityControlAction(
          quantity: order.quantity,
          onIncrease: () {
            userOrderNotifier.increaseQuantity(order.productId);
          },
          onDecrease: () {
            userOrderNotifier.decreaseQuantity(order.productId);
          },
        ),
      ),
    );
  }
}
