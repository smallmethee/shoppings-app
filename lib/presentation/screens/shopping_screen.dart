import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shoppings_app/data/models/products/product_list_model.dart';
import 'package:shoppings_app/presentation/notifiers/product_notifier.dart';
import 'package:shoppings_app/presentation/providers/products_provider.dart';
import 'package:shoppings_app/presentation/widgets/shopping/shopping_item.dart';
import 'package:shoppings_app/shared/widgets/errors/error_refresh.dart';
import 'package:shoppings_app/shared/widgets/products/shimmer_product_item.dart';

class ShoppingScreen extends HookConsumerWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refreshController = useMemoized(() => RefreshController(), []);
    final productListState = ref.watch(productListNotifierProvider);
    final productListNotifier = ref.read(productListNotifierProvider.notifier);

    final productRecommendList = ref.watch(productRecommendListProvider);

    void onRefresh() async {
      ref.invalidate(productRecommendListProvider);
      await ref.read(productRecommendListProvider.future);

      ref.invalidate(productListNotifierProvider);
      await ref.read(productListNotifierProvider.future);
      refreshController.refreshCompleted();
    }

    return SafeArea(
      child: Scaffold(
        body: SmartRefresher(
          controller: refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: onRefresh,
          onLoading: () async {
            final loadmore = await productListNotifier.loadMore();
            if (loadmore) {
              refreshController.loadComplete();
            } else {
              refreshController.loadNoData();
            }
          },
          child: ListView(children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Recommend Product', style: TextStyle(fontSize: 20)),
            ),
            productRecommendList.when(
              data: (productList) => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final product = productList[index];
                  return ShoppingItem(
                    product: ProductListItem(
                        id: product.id,
                        name: product.name,
                        price: product.price),
                  );
                },
              ),
              loading: () => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => const ShimmerProductItem()),
              error: (error, stack) => ErrorRefresh(
                  onRefresh: () =>
                      ref.refresh(productRecommendListProvider.future)),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Latest Product', style: TextStyle(fontSize: 20)),
            ),
            productListState.when(
              data: (productList) => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productList.items?.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final product = productList.items![index];
                  return ShoppingItem(
                    product: product,
                  );
                },
              ),
              loading: () => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => const ShimmerProductItem()),
              error: (error, stack) => ErrorRefresh(
                  onRefresh: () =>
                      ref.refresh(productListNotifierProvider.future)),
            )
          ]),
        ),
      ),
    );
  }
}
