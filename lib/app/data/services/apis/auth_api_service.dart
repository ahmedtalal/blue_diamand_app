import 'package:dio/dio.dart';
import 'package:drinking_app/app/config/dio_exceptions.dart';
import 'package:drinking_app/app/core/utils/api_paths.dart';
import 'package:drinking_app/app/core/utils/debug_prints.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/data/models/auth_model.dart';
import 'package:drinking_app/app/data/models/user_local_model.dart';
import 'package:drinking_app/app/data/services/apis/curd_api_helper.dart';
import 'package:drinking_app/app/data/services/local/user_info_local_Service.dart';
import 'package:drinking_app/app/domain/entities/auth_entity.dart';
import 'package:drinking_app/app/domain/entities/user_local_entity.dart';

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
      printError("error from catch ");
      return failedRequest(responseBody: e.toString());
    }
  }

  Future<Map<String, dynamic>> loginApiService(AuthEntity authEntity) async {
    try {
      Map<String, dynamic> data = AuthModel.loginToJson(authEntity);
      printInfo("the login json is $data");
      Response response = await _curdApiHelper.postRequest(
          path: LOGIN_REQUEST_API_PATH, data: data);
      return successRequest(responseBody: response.data);
    } on DioError catch (e) {
      printError("the error type is ${e.message}");
      String message = DioExceptions.dioErrorHandling(e);
      printError("the login dio error is $message");
      return failedRequest(responseBody: message);
    } catch (e) {
      printError("the login catch error is $e");
      return failedRequest(responseBody: e.toString());
    }
  }

  bool checkIsUserLoginedService() {
    final result = UserInfoLocalService.instance().getUserInfo();
    if (result[mapvalue] != "user not found") {
      return true;
    }
    return false;
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
      Map<String, dynamic> userInfo =
          UserInfoLocalService.instance().getUserInfo();
      printWarning("the user info is $userInfo");
      UserLocalEntity userData = UserLocalModel.fromJson(userInfo);
      //UserInfoLocalService.instance().convertStringToJson(userInfo);
      printInfo("the user json is $userData");
      String userToken = userData.userToken!;
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
    } // catch (e) {
    //   print("error from catch ");
    //   return failedRequest(responseBody: e.to);
    // }
  }
}
