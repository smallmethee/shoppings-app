import 'package:shoppings_app/data/datasource/product_datasource.dart';
import 'package:shoppings_app/data/models/products/product_list_model.dart';
import 'package:shoppings_app/data/models/products/product_list_params.dart';
import 'package:shoppings_app/data/models/products/product_recommended_model.dart';
import 'package:shoppings_app/data/repositories/products/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductDatasource _datasource;
  ProductsRepositoryImpl(this._datasource);

  @override
  Future<ProductListModel> productList(ProductListParams params) async {
    final result = await _datasource.productList(params);
    return result.fold(
      (appException) {
        throw appException;
      },
      (data) => data,
    );
  }

  @override
  Future<List<ProductRecommendedModel>> productRecommendList() async {
    final result = await _datasource.productRecommendList();
    return result.fold(
      (appException) {
        throw appException;
      },
      (data) => data,
    );
  }
}
