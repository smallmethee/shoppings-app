import 'dart:convert';

import 'package:shoppings_app/domain/entities/orders/user_order.dart';
import 'package:shoppings_app/shared/data/local/storage_service.dart';
import 'package:shoppings_app/shared/data/remote/network.dart';
import 'package:shoppings_app/shared/domain/models/either.dart';
import 'package:shoppings_app/shared/exceptions/http_exception.dart';

class OrderDatasource {
  final StorageService _storageService;
  final NetworkService _networkService;
  OrderDatasource(this._storageService, this._networkService);

  static String userOrdersKey = 'user_orders';

  Future<void> saveUserOrders(List<UserOrder> orders) async {
    final ordersList = orders.map((e) => jsonEncode(e.toJson())).toList();
    await _storageService.setStringList(userOrdersKey, ordersList);
  }

  Future<List<UserOrder>> getUserOrders() async {
    final ordersList = await _storageService.getStringList(userOrdersKey);
    if (ordersList == null) return [];
    return ordersList.map((e) => UserOrder.fromJson(jsonDecode(e))).toList();
  }

  Future<Either<AppException, void>> sendOrder(List<UserOrder> orders) async {
    final products = orders.map((e) => e.productId).toList();
    final response = await _networkService
        .post('/orders/checkout', data: {"products": products});
    return response.fold(
      (l) => Left(l),
      (r) {
        return const Right(null);
      },
    );
  }
}
