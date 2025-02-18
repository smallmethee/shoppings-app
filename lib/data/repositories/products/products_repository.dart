import 'package:shoppings_app/data/models/products/product_list_model.dart';
import 'package:shoppings_app/data/models/products/product_list_params.dart';
import 'package:shoppings_app/data/models/products/product_recommended_model.dart';

abstract class ProductsRepository {
  Future<ProductListModel> productList(ProductListParams params);
  Future<List<ProductRecommendedModel>> productRecommendList();
}
