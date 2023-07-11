import 'package:dio/dio.dart';

enum ApiExceptionCause {
  notAuthorised,
  internalError,
  forbidden,
  notFound,
  noConnection,
  paymentRequired,
  unprocessableEntity,
  tooManyRequests,
  unknown;

  static ApiExceptionCause fromStatusCode(int? statusCode) {
    switch (statusCode) {
      case null:
        // The request can't reach the server
        return ApiExceptionCause.noConnection;
      case 401:
        return ApiExceptionCause.notAuthorised;
      case 420:
        return ApiExceptionCause.paymentRequired;
      case 403:
        return ApiExceptionCause.forbidden;
      case 404:
        return ApiExceptionCause.notFound;
      case 422:
        return ApiExceptionCause.unprocessableEntity;
      case 429:
        return ApiExceptionCause.tooManyRequests;
      case 500:
        return ApiExceptionCause.internalError;
      default:
        return ApiExceptionCause.unknown;
    }
  }
}

class ApiException implements Exception {
  ApiExceptionCause cause;
  dynamic body;

  ApiException({
    required this.cause,
    required this.body,
  });

  factory ApiException.fromDioError(DioException err) {
    return ApiException(
      cause: ApiExceptionCause.fromStatusCode(err.response?.statusCode),
      body: err.response?.data,
    );
  }
}
