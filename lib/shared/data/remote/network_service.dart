import 'package:dio/dio.dart' show FormData, Options;

import '../../domain/models/either.dart';
import '../../domain/models/response.dart';
import '../../exceptions/http_exception.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<AppException, Response>> get(String endpoint,
      {Map<String, dynamic>? queryParameters, Options? options});

  Future<Either<AppException, Response>> post(
    String endpoint, {
    Object? data,
  });

  Future<Either<AppException, Response>> postFormData(
    String endpoint, {
    required FormData data,
  });

  Future<Either<AppException, Response>> put(
    String endpoint, {
    Map<String, dynamic>? data,
  });

  Future<Either<AppException, Response>> patch(
    String endpoint, {
    Object? data,
  });

  Future<Either<AppException, Response>> delete(
    String endpoint, {
    Map<String, dynamic>? data,
  });

  Future<Either<AppException, Response>> head(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, Response>> downloadFile(
    String url,
    String savePath, {
    void Function(int, int)? onReceiveProgress,
  });
}
