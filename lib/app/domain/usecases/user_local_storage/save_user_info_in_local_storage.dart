import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/core/utils/widgets/error__shared_widget.dart';
import 'package:drinking_app/app/data/services/local/user_info_local_Service.dart';
import 'package:drinking_app/app/presentation/views/main_view.dart';
import 'package:get/get.dart';

class SaveUserInfoLocalStorage {
  static SaveUserInfoLocalStorage? _saveUserInfoLocalStorage;
  SaveUserInfoLocalStorage._internal();
  static SaveUserInfoLocalStorage instance() {
    if (_saveUserInfoLocalStorage == null) {
      return _saveUserInfoLocalStorage = SaveUserInfoLocalStorage._internal();
    }
    return _saveUserInfoLocalStorage!;
  }

  call(var result) async {
    final userInfo = await UserInfoLocalService.instance().saveUserInfo(
      result[mapvalue].toString(),
    );
    if (userInfo[mapKey].toString() == successMapkey) {
      Get.to(
        () => const MainView(),
      );
    } else {
      print("the error is ${result[mapvalue].toString()}");
      showErrorDialog(
        result[mapvalue],
        "user info exception",
      );
    }
  }
}
