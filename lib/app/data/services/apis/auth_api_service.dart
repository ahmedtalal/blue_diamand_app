// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drinking_app/app/config/dio_exceptions.dart';
import 'package:drinking_app/app/core/utils/api_paths.dart';
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
      Response response = await _curdApiHelper.postRequest(
          path: REGISTER_REQUEST_API_PATH, data: data);
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
      Response response = await _curdApiHelper.postRequest(
          path: LOGIN_REQUEST_API_PATH, data: data);
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

  Future<bool> logoutApiService() async {
    try {
      await UserInfoLocalService.instance().deleteUserInfo();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>> changePaswordApiService({
    required Map<String, dynamic> data,
  }) async {
    try {
      String userInfo = UserInfoLocalService.instance().getUserInfo();
      Map userData =
          UserInfoLocalService.instance().convertStringToJson(userInfo);
      String userToken = userData["token"];
      Options options =
          Options(headers: {"authorization": "Bearer $userToken"});
      Response response = await CurdApiHelper.instance.putRequest(
        path: CHANGE_PASSWORD_REQUEST_API_PATH,
        options: options,
        data: data,
      );
      return successRequest(responseBody: response.data);
    } on DioError catch (e) {
      String error = DioExceptions.dioErrorHandling(e);
      return failedRequest(responseBody: error);
    } catch (e) {
      print("error from catch ");
      return failedRequest(responseBody: e.toString());
    }
  }
}
