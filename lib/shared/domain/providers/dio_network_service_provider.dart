import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/remote/dio_network_service.dart';

part 'dio_network_service_provider.g.dart';

@riverpod
DioNetworkService networkService(Ref ref) {
  final Dio dio = Dio();
  final dioService = DioNetworkService(dio);
  return dioService;
}
