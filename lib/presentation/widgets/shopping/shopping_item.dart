import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppings_app/data/models/products/product_list_model.dart';
import 'package:shoppings_app/shared/widgets/products/product_item.dart';

class ShoppingItem extends HookConsumerWidget {
  const ShoppingItem({
    super.key,
    required this.product,
  });
  final ProductListItem product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProductItem(
        name: product.name ?? '',
        price: product.price ?? 0,
        action: AddToCartAction(onAddToCart: () {}));
  }
}
