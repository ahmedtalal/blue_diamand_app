// ignore_for_file: avoid_print

import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:drinking_app/app/core/utils/api_paths.dart';
import 'package:flutter/foundation.dart';

class CurdApiHelper {
  // here using singleton pattern
  static final CurdApiHelper _curdApiHelper = CurdApiHelper._internal();
  CurdApiHelper._internal();
  static CurdApiHelper get instance => _curdApiHelper;

  Dio _initDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: API_BASE_URL,
        contentType: "application/json",
        headers: {
          "XApiKey": "HERE > XAPIKEY",
        },
      ),
    );
    if (API_BASE_URL.toLowerCase().startsWith('https') && !kIsWeb) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient dioClient) {
        dioClient.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
        return dioClient;
      };
    }

    return dio;
  }

  Future<Response> postRequest({
    Map<String, dynamic>? data,
    required String path,
    Map<String, dynamic>? parameters,
    Options? options,
  }) async {
    Response response = await _initDio().post(
      path,
      data: data,
      queryParameters: parameters,
      options: options,
    );
    print(response);
    return response;
  }

  Future<Response> getRequest({
    required String path,
    Map<String, dynamic>? parameters,
    Options? options,
  }) async {
    return await _initDio().get(
      path,
      queryParameters: parameters,
      options: options,
    );
  }

  Future<Response> putRequest({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameter,
    Options? options,
  }) async {
    return await _initDio().put(
      path,
      data: data,
      queryParameters: queryParameter,
      options: options,
    );
  }

  Future<Response> deleteRequest({
    required String path,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    return await _initDio().delete(
      path,
      data: data,
      queryParameters: parameters,
      options: options,
    );
  }
}
