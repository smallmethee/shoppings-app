import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoppings_app/data/datasource/product_datasource.dart';
import 'package:shoppings_app/data/models/products/product_list_model.dart';
import 'package:shoppings_app/data/models/products/product_list_params.dart';
import 'package:shoppings_app/data/models/products/product_recommended_model.dart';
import 'package:shoppings_app/data/repositories/products/products_repository_impl.dart';
import 'package:shoppings_app/shared/domain/providers/dio_network_service_provider.dart';

part 'products_provider.g.dart';

@riverpod
ProductsRepositoryImpl productRepoImpl(Ref ref) {
  final networkService = ref.watch(networkServiceProvider);
  final datasource = ProductDatasource(networkService);
  return ProductsRepositoryImpl(datasource);
}

@riverpod
Future<ProductListModel> productList(Ref ref) {
  final repo = ref.watch(productRepoImplProvider);
  return repo.productList(ProductListParams(limit: 20));
}

@riverpod
Future<List<ProductRecommendedModel>> productRecommendList(Ref ref) {
  final repo = ref.watch(productRepoImplProvider);
  return repo.productRecommendList();
}
