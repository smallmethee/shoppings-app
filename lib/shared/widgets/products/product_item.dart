import 'package:flutter/material.dart';
import 'package:shoppings_app/shared/extensions/image_path.dart';

abstract class ProductItemAction {
  Widget buildAction();
}

class AddToCartAction extends ProductItemAction {
  final VoidCallback onAddToCart;

  AddToCartAction({required this.onAddToCart});

  @override
  Widget buildAction() {
    return ElevatedButton(
      onPressed: onAddToCart,
      child: const Text("Add to cart"),
    );
  }
}

class QuantityControlAction extends ProductItemAction {
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  QuantityControlAction({
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget buildAction() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove, color: Colors.purple),
          onPressed: onDecrease,
        ),
        Text(
          '$quantity',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.add, color: Colors.purple),
          onPressed: onIncrease,
        ),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.name,
    required this.price,
    required this.action,
  });

  final String name;
  final double price;
  final ProductItemAction action;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'product'.toPng,
                    height: 76,
                    width: 76,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple.shade900,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${price.toStringAsFixed(2)} / unit',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          action.buildAction(),
        ],
      ),
    );
  }
}
