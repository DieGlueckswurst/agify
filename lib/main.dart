import 'package:agify/app.dart';
import 'package:agify/data/backend/agify/agify_api.dart';
import 'package:agify/data/backend/api_base.dart/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  final apiClient = ApiClient(
    client: Dio(),
  );

  final agifyApi = AgifyApi(apiClient: apiClient);

  runApp(
    App(
      agifyApi: agifyApi,
    ),
  );
}
