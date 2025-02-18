// ignore_for_file: type_literal_in_constant_pattern

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import '../data/remote/network_service.dart';
import '../domain/models/either.dart';
import '../domain/models/response.dart' as response;
import '../exceptions/http_exception.dart';

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<AppException, response.Response>>
      handleException<T extends Object>(
          Future<Response<dynamic>> Function() handler,
          {String endpoint = ''}) async {
    try {
      final res = await handler();
      return Right(
        response.Response(
          statusCode: res.statusCode ?? 200,
          data: res.data,
          statusMessage: res.statusMessage,
        ),
      );
    } catch (e) {
      String message = '';
      String identifier = '';
      int statusCode = 0;
      log(e.runtimeType.toString());
      switch (e.runtimeType) {
        case SocketException:
          e as SocketException;
          message = 'Unable to connect to the server.';
          statusCode = 0;
          identifier = 'Socket Exception ${e.message}\n at $endpoint';
          break;

        case DioException:
          final dioError = e as DioException;
          statusCode = dioError.response?.statusCode ?? 1;
          switch (dioError.type) {
            case DioExceptionType.connectionTimeout:
              message = 'Connection timeout. Please try again later.';
              identifier = 'DioException - Connect timeout at $endpoint';
              break;
            case DioExceptionType.sendTimeout:
              message = 'Send timeout. The request could not be completed.';
              identifier = 'DioException - Send timeout at $endpoint';
              break;
            case DioExceptionType.receiveTimeout:
              message = 'Receive timeout. Server took too long to respond.';
              identifier = 'DioException - Receive timeout at $endpoint';
              break;
            case DioExceptionType.badResponse:
              statusCode = dioError.response?.statusCode ?? 1;
              switch (statusCode) {
                case 400:
                  message = dioError.response?.data?['message'] ??
                      'Bad request. Please check your input.';
                  identifier = 'DioException - Bad Request (400) at $endpoint';
                  break;
                case 401:
                  message = dioError.response?.data?['errors']?[0]
                          ?['message'] ??
                      'Unauthorized. Please check your credentials.';
                  identifier = 'DioException - Unauthorized (401) at $endpoint';
                  break;
                case 500:
                  message = dioError.response?.data?['message'] ??
                      'Internal server error. Please try again later.';
                  identifier = 'DioException - Server Error (500) at $endpoint';
                  break;
                default:
                  message = dioError.response?.data?['message'] ??
                      'An error occurred with the server.';
                  identifier =
                      'DioException - HTTP error ($statusCode) at $endpoint';
              }
              break;
            case DioExceptionType.cancel:
              message = 'Request was cancelled.';
              identifier = 'DioException - Request cancelled at $endpoint';
              break;
            case DioExceptionType.unknown:
              if (dioError.error is SocketException) {
                message = 'No internet connection. Please check your network.';
                identifier = 'DioException - Network error at $endpoint';
              } else {
                message = 'An unexpected error occurred.';
                identifier = 'DioException - Other error at $endpoint';
              }
              break;
            case DioExceptionType.badCertificate:
              message = 'An badCertificate error occurred.';
              identifier = 'DioException - badCertificate error at $endpoint';
              break;
            case DioExceptionType.connectionError:
              message = 'An connectionError error occurred.';
              identifier = 'DioException - connectionError error at $endpoint';
              break;
          }
          break;
        default:
          message = 'Unknown error occurred';
          statusCode = 2;
          identifier = 'Unknown error ${e.toString()}\n at $endpoint';
      }
      return Left(
        AppException(
          message: message,
          statusCode: statusCode,
          identifier: identifier,
        ),
      );
    }
  }
}
