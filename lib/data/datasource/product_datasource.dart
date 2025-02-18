import 'package:shoppings_app/data/models/products/product_list_model.dart';
import 'package:shoppings_app/data/models/products/product_list_params.dart';
import 'package:shoppings_app/data/models/products/product_recommended_model.dart';
import 'package:shoppings_app/shared/data/remote/network.dart';
import 'package:shoppings_app/shared/domain/models/either.dart';
import 'package:shoppings_app/shared/exceptions/http_exception.dart';

class ProductDatasource {
  final NetworkService _networkService;
  ProductDatasource(this._networkService);

  Future<Either<AppException, ProductListModel>> productList(
      ProductListParams params) async {
    final response = await _networkService.get('/products',
        queryParameters: params.toJson());
    return response.fold(
      (l) => Left(l),
      (r) {
        return Right(ProductListModel.fromJson(r.data));
      },
    );
  }

  Future<Either<AppException, List<ProductRecommendedModel>>>
      productRecommendList() async {
    final response = await _networkService.get('/recommended-products');
    return response.fold(
      (l) => Left(l),
      (r) {
        return Right((r.data as List)
            .map((item) => ProductRecommendedModel.fromJson(item))
            .toList());
      },
    );
  }
}
