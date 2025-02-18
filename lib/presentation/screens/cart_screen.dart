import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppings_app/domain/entities/orders/user_order.dart';
import 'package:shoppings_app/presentation/notifiers/user_order_notifier.dart';
import 'package:shoppings_app/presentation/providers/orders_provider.dart';
import 'package:shoppings_app/presentation/widgets/orders/order_item.dart';
import 'package:shoppings_app/routers/routes.dart';
import 'package:shoppings_app/shared/extensions/currency.dart';
import 'package:shoppings_app/shared/utils/theme_data.dart';
import 'package:shoppings_app/shared/widgets/actions/action_button.dart';
import 'package:shoppings_app/shared/widgets/layouts/top_bar.dart';
import 'package:shoppings_app/shared/widgets/notifications/snack_bar.dart';

class CartScreen extends HookConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userOrders = ref.watch(userOrderControllerProvider);
    final shoppingSuccess = useState(false);

    Future<void> sendOrder(List<UserOrder> orders) async {
      try {
        await ref.read(checkOutOrderProvider(orders).future);
        await ref.read(userOrderControllerProvider.notifier).clearOrders();
        shoppingSuccess.value = true;
      } catch (e) {
        log('error => $e');
        showCustomSnackBar(context, 'Something went wrong');
      }
    }

    return Scaffold(
      appBar: const TopBar(title: Text('cart')),
      body: userOrders.when(
        data: (data) {
          if (shoppingSuccess.value) {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Success!!', style: TextStyle(fontSize: 20)),
                    const Text('Thank you for shopping with us!'),
                    ElevatedButton(
                        onPressed: () {
                          const ShoppingScreenRoute().go(context);
                        },
                        child: const Text('shopping again'))
                  ]),
            );
          }
          if (data.isEmpty) {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Empty Cart'),
                    ElevatedButton(
                        onPressed: () {
                          const ShoppingScreenRoute().go(context);
                        },
                        child: const Text('Go to shopping'))
                  ]),
            );
          }
          return ListView(
            children: [
              for (var order in data) OrderItem(order: order),
            ],
          );
        },
        error: (error, stackTrace) => const Text('error'),
        loading: () => const Text('loading...'),
      ),
      bottomNavigationBar: Consumer(
        builder: (context, ref, child) {
          final userOrders = ref.watch(userOrderControllerProvider);
          final orderSummaryData = ref.watch(orderSummaryNotifierProvider);

          return userOrders.when(
            skipLoadingOnRefresh: true,
            data: (value) {
              if (value.isEmpty) {
                return const SizedBox();
              }
              return Container(
                padding: const EdgeInsets.all(16),
                color: AppColors.subtlePurple,
                height: 175,
                child: SafeArea(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Subtotal',
                              style: TextStyle(
                                color: AppColors.mutedPurple,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              orderSummaryData.subtotal.toThaiBaht,
                              style: TextStyle(
                                color: AppColors.mutedPurple,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Promotion discount',
                              style: TextStyle(
                                color: AppColors.mutedPurple,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              orderSummaryData.discount > 0
                                  ? '-${orderSummaryData.discount.toThaiBaht}'
                                  : 0.toStringAsFixed(2),
                              style: const TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text(orderSummaryData.total.toThaiBaht,
                                  style: TextStyle(
                                      color: AppColors.mutedPurple,
                                      fontSize: 30)),
                              const Spacer(),
                              ActionButton(
                                  onPressed: () async {
                                    await sendOrder(value);
                                  },
                                  label: const Text('Checkout'))
                            ],
                          ),
                        ),
                      ]),
                ),
              );
            },
            error: (error, stackTrace) => const Text('error'),
            loading: () => const Text('loading...'),
          );
        },
      ),
    );
  }
}
