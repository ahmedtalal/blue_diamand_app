import 'dart:convert';

import 'package:drinking_app/app/core/utils/debug_prints.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/data/models/user_local_model.dart';
import 'package:drinking_app/app/domain/entities/user_local_entity.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';

class UserInfoLocalService {
  static UserInfoLocalService? _userInfoLocalService;
  UserInfoLocalService._internal();
  static UserInfoLocalService instance() {
    if (_userInfoLocalService == null) {
      return _userInfoLocalService = UserInfoLocalService._internal();
    }
    return _userInfoLocalService!;
  }

  final GetStorage _getStorage = GetStorage();
  final String _userKey = "userKey";

  Future<Map<String, dynamic>> saveUserInfo(Map<String, dynamic> model) async {
    try {
      await _getStorage.write(_userKey, model);
      return successRequest(responseBody: true);
    } catch (e) {
      return failedRequest(responseBody: false);
    }
  }

  Map<String, dynamic> getUserInfo() {
    return _getStorage.read(_userKey) ??
        failedRequest(responseBody: "user not found");
  }

  Future<void> deleteUserInfo() async {
    await _getStorage.remove(_userKey);
  }

  UserLocalEntity convertStringToJson(String data) {
    printInfo("the info data is $data");
    Map<String, dynamic> d =
        json.decode(data.toString()).cast<Map<String, dynamic>>();
    printInfo("the data is $d");
    return UserLocalModel.fromJson(d);
  }
}
