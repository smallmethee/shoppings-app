import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoppings_app/data/models/products/product_list_model.dart';
import 'package:shoppings_app/data/models/products/product_list_params.dart';
import 'package:shoppings_app/presentation/providers/products_provider.dart';

part 'product_notifier.g.dart';

@riverpod
class ProductListNotifier extends _$ProductListNotifier {
  final int _perPage = 20;
  bool _hasMore = true;

  @override
  Future<ProductListModel> build() async {
    return _fetchProducts(reset: true);
  }

  Future<bool> loadMore() async {
    if (!_hasMore || state.isLoading || state.value?.nextCursor == null) {
      return false;
    }
    final newProducts = await _fetchProducts();
    state = state.whenData((oldProducts) => ProductListModel(
          items: [...oldProducts.items ?? [], ...newProducts.items ?? []],
          nextCursor: newProducts.nextCursor,
        ));
    if (newProducts.nextCursor == null) {
      _hasMore = false;
      return false;
    }
    return true;
  }

  Future<ProductListModel> _fetchProducts({bool reset = false}) async {
    if (reset) {
      _hasMore = true;
    }
    final repo = ref.read(productRepoImplProvider);
    final params = ProductListParams(
        limit: _perPage, cursor: reset ? null : state.value?.nextCursor);
    return await repo.productList(params);
  }
}
