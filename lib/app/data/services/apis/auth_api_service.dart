// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:drinking_app/app/config/dio_exceptions.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/data/models/auth_model.dart';
import 'package:drinking_app/app/data/services/apis/curd_api_helper.dart';
import 'package:drinking_app/app/data/services/local/user_info_local_Service.dart';
import 'package:drinking_app/app/domain/entities/auth_entity.dart';

class AuthApiService {
  static final AuthApiService _authApiService = AuthApiService._internal();
  AuthApiService._internal();
  static AuthApiService get instance => _authApiService;
  final CurdApiHelper _curdApiHelper =
      CurdApiHelper.instance; // composition relationship (coupling)!?

  Future<Map<String, dynamic>> registerApiService(AuthEntity authEntity) async {
    try {
      Map<String, dynamic> data = AuthModel.toJson(authEntity);
      Response response =
          await _curdApiHelper.postRequest(path: "user/create/", data: data);
      return successRequest(responseBody: response.data);
    } on DioError catch (e) {
      String error = DioExceptions.dioErrorHandling(e);
      return failedRequest(responseBody: error);
    } catch (e) {
      print("error from catch ");
      return failedRequest(responseBody: e.toString());
    }
  }

  Future<Map<String, dynamic>> loginApiService(AuthEntity authEntity) async {
    try {
      Map<String, dynamic> data = AuthModel.toJson(authEntity);
      Response response =
          await _curdApiHelper.postRequest(path: "user/login/", data: data);
      return successRequest(responseBody: response.data);
    } on DioError catch (e) {
      String message = DioExceptions.dioErrorHandling(e);
      return failedRequest(responseBody: message);
    } catch (e) {
      return failedRequest(responseBody: e.toString());
    }
  }

  bool checkIsUserLoginedService() {
    return UserInfoLocalService.instance().getUserInfo() != userNotFound
        ? true
        : false;
  }
}
