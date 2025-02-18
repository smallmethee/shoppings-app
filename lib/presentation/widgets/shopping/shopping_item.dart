import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppings_app/data/models/products/product_list_model.dart';
import 'package:shoppings_app/domain/entities/orders/user_order.dart';
import 'package:shoppings_app/presentation/notifiers/user_order_notifier.dart';
import 'package:shoppings_app/shared/widgets/products/product_item.dart';
import 'package:collection/collection.dart';

class ShoppingItem extends HookConsumerWidget {
  const ShoppingItem({
    super.key,
    required this.product,
  });
  final ProductListItem product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userOrderNotifier = ref.read(userOrderControllerProvider.notifier);
    final userOrders = ref.watch(userOrderControllerProvider);

    final existingOrder = useMemoized(
        () => userOrders.maybeWhen(
            data: (data) => data.firstWhereOrNull(
                  (order) => order.productId == product.id,
                ),
            orElse: () => null),
        [userOrders]);

    return ProductItem(
        name: product.name ?? '',
        price: product.price ?? 0,
        action: existingOrder == null
            ? AddToCartAction(onAddToCart: () {
                userOrderNotifier.addOrder(UserOrder(
                    name: product.name ?? '',
                    price: product.price ?? 0,
                    productId: product.id!,
                    quantity: 1));
              })
            : QuantityControlAction(
                quantity: existingOrder.quantity,
                onIncrease: () {
                  userOrderNotifier.increaseQuantity(existingOrder.productId);
                },
                onDecrease: () {
                  userOrderNotifier.decreaseQuantity(existingOrder.productId);
                },
              ));
  }
}
