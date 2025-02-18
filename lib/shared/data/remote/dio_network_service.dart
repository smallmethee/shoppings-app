import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../configs/app_configs.dart';
import '../../domain/models/either.dart';
import '../../domain/models/response.dart' as response;
import '../../exceptions/http_exception.dart';
import '../../mixins/exception_handler_mixin.dart';
import 'network_service.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio;

  DioNetworkService(this.dio) {
    dio.options = dioBaseOptions;
    if (kDebugMode) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  String get baseUrl => AppConfigs.apiUrl;

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    dio.options.headers = header;
    return header;
  }

  @override
  Future<Either<AppException, response.Response>> post(String endpoint,
      {Object? data}) {
    final res = handleException(
      () => dio.post(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> get(String endpoint,
      {Map<String, dynamic>? queryParameters, Options? options}) {
    final res = handleException(
      () =>
          dio.get(endpoint, queryParameters: queryParameters, options: options),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> put(String endpoint,
      {Map<String, dynamic>? data}) {
    final res = handleException(
      () => dio.put(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> patch(String endpoint,
      {Object? data}) {
    final res = handleException(
      () => dio.patch(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> delete(String endpoint,
      {Map<String, dynamic>? data}) {
    final res = handleException(
      () => dio.delete(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> head(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
      () => dio.head(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> downloadFile(
      String url, String savePath,
      {void Function(int count, int total)? onReceiveProgress}) {
    final res = handleException(
      () => dio.download(
        url,
        savePath,
        onReceiveProgress: onReceiveProgress,
      ),
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> postFormData(String endpoint,
      {required FormData data}) {
    final res = handleException(
      () => dio.post(endpoint,
          data: data,
          options: Options(
            contentType: 'multipart/form-data',
          )),
      endpoint: endpoint,
    );
    return res;
  }
}
