import 'package:dio/dio.dart';
import 'package:drinking_app/app/config/dio_exceptions.dart';
import 'package:drinking_app/app/core/utils/api_paths.dart';
import 'package:drinking_app/app/core/utils/debug_prints.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/data/models/user_info_model.dart';
import 'package:drinking_app/app/data/services/apis/curd_api_helper.dart';

class UserApiServices {
  static UserApiServices? _userApiServices;
  UserApiServices._internal();
  static UserApiServices instance() {
    if (_userApiServices == null) {
      return _userApiServices = UserApiServices._internal();
    }
    return _userApiServices!;
  }

  Future<Map<String, dynamic>> getUserModelService(String userId) async {
    try {
      Response response = await CurdApiHelper.instance
          .getRequest(path: GET_USER_MODEL_API_PATH + userId);
      printDone(
          "the get user info is ${UserInfoModel.fromJson(response.data).user!.fullName!}");
      return successRequest(
          responseBody: UserInfoModel.fromJson(response.data));
    } on DioError catch (e) {
      String message = DioExceptions.dioErrorHandling(e);
      printError("the get user dio error is $message");
      return failedRequest(responseBody: message);
    } catch (e) {
      printError("the get user catch error is ${e.toString()}");
      return failedRequest(responseBody: e.toString());
    }
  }
}
