import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoppings_app/data/datasource/order_datasource.dart';
import 'package:shoppings_app/data/repositories/orders/order_repository_impl.dart';
import 'package:shoppings_app/domain/entities/orders/user_order.dart';
import 'package:shoppings_app/shared/domain/providers/dio_network_service_provider.dart';
import 'package:shoppings_app/shared/domain/providers/shared_preferences_storage_service_provider.dart';

part 'orders_provider.g.dart';

@riverpod
OrderRepositoryImpl orderRepoImpl(Ref ref) {
  final networkService = ref.watch(networkServiceProvider);
  final storageService = ref.watch(storageServiceProvider);
  final datasource = OrderDatasource(storageService, networkService);
  return OrderRepositoryImpl(datasource);
}

@riverpod
Future<void> checkOutOrder(Ref ref, List<UserOrder> orders) {
  final repo = ref.read(orderRepoImplProvider);
  return repo.sendOrder(orders);
}
