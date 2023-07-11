import 'dart:async';

import 'package:dio/dio.dart';
import 'api_exeption.dart';

class ApiClient {
  final Dio client;
  ApiClient({required this.client});

  Future<T> get<T>({
    required String endpoint,
    Map<String, Object?>? queryParameters,
  }) async {
    try {
      final response = await client.get<T>(
        endpoint,
        queryParameters: queryParameters,
      );
      return response.data!;
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Never _handleError(DioException error) {
    throw ApiException.fromDioError(error);
  }
}
