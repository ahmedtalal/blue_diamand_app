// ignore_for_file: avoid_print

import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CurdApiHelper {
  // here using singleton pattern
  static final CurdApiHelper _curdApiHelper = CurdApiHelper._internal();
  CurdApiHelper._internal();
  static CurdApiHelper get instance => _curdApiHelper;

  static const apiBaseUrl = "https://e-commerce-node-api-d7f3.onrender.com/api/";
  Dio _initDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: apiBaseUrl,
        contentType: "application/json",
        // headers: {
        //   "XApiKey": "HERE > XAPIKEY",
        // },
      ),
    );
    if (apiBaseUrl.toLowerCase().startsWith('https') && !kIsWeb) {
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
  }) async {
    Response response =
        await _initDio().post(path, data: data, queryParameters: parameters);
    print(response);
    return response;
  }

  Future<Response> getRequest({
    required String path,
    Map<String, dynamic>? parameters,
  }) async {
    return await _initDio().get(path, queryParameters: parameters);
  }

  Future<Response> putRequest({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameter,
  }) async {
    return await _initDio()
        .put(path, data: data, queryParameters: queryParameter);
  }

  Future<Response> deleteRequest(
      {required String path,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? data}) async {
    return await _initDio().delete(
      path,
      data: data,
      queryParameters: parameters,
    );
  }
}
