import 'package:drinking_app/app/core/utils/strings.dart';
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

  Future<Map<String, dynamic>> saveUserInfo(String model) async {
    try {
      await _getStorage.write(_userKey, model);
      return successRequest(responseBody: true);
    } catch (e) {
      return failedRequest(responseBody: false);
    }
  }

  String getUserInfo() {
    return _getStorage.read(_userKey) ?? userNotFound;
  }
}
