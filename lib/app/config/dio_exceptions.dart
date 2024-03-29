import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  static dioErrorHandling(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        return "request to api server was cancelled";
      case DioErrorType.connectTimeout:
        return "Connection timeout with api server";
      case DioErrorType.receiveTimeout:
        return "receive timeout in connection with api server";
      case DioErrorType.sendTimeout:
        return "send timeout in connection with api server";
      case DioErrorType.other:
        return "connection to api server failed due to internet connection";
      case DioErrorType.response:
        return _handleErrorMessage(dioError.response!.statusCode, dioError);
      default:
        return "something went wrong";
    }
  }

  static String? _handleErrorMessage(int? statusCode, DioError error) {
    switch (statusCode) {
      case 400:
        return "Bad request and the error is ${error.response!.data}";
      case 409:
        return error.response!.data["error"];
      case 500:
        return "internal server error";
      case 401:
        return error.response!.data["error"];
      case 404:
        return error.response!.data["error"];
      default:
        return "oops something went wrong";
    }
  }
}
