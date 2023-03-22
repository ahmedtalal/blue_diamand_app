import 'package:drinking_app/app/core/utils/debug_prints.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/data/models/user_info_model.dart';
import 'package:drinking_app/app/data/models/user_local_model.dart';
import 'package:drinking_app/app/data/repositories/api/user_repository_imp.dart';
import 'package:drinking_app/app/data/services/local/user_info_local_Service.dart';
import 'package:drinking_app/app/domain/usecases/usecase_provider.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController? _userController;
  UserController._internal();
  static UserController instance() {
    if (_userController == null) {
      return _userController = UserController._internal();
    }
    return _userController!;
  }

  final userInfoModel = UserInfoModel().obs;
  var isLoading = false.obs;
  var userName = "".obs;
  var fullName = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var address = "".obs;
  var isVisible = false.obs;
  RxBool isWorkModelVisible = false.obs;

  onChangeUserName(String? newValue) {
    userName.value = newValue!;
  }

  onChangeFullName(String? newValue) {
    fullName.value = newValue!;
  }

  onChangeEmail(String? newValue) {
    email.value = newValue!;
  }

  onChangePhone(String? newValue) {
    phone.value = newValue!;
  }

  onChangeAdress(String? newValue) {
    address.value = newValue!;
  }

  onChageUserModel(UserInfoModel model) {
    userInfoModel.value = model;
  }

  onShowResidentailOrNot() {
    isVisible.value = !isVisible.value;
  }

  onShowWorkAdressOrNot() {
    isWorkModelVisible.value = !isWorkModelVisible.value;
  }

  getUserInfoCon() async {
    try {
      isLoading.value = true;
      final result = UserInfoLocalService.instance().getUserInfo();
      UserLocalModel userLocalModel = UserLocalModel.fromJson(result);
      printInfo("the user from local storage => $result");
      int userId = userLocalModel.userId!;
      printDone("the user id is => $userId");
      final data = await UseCaseProvider.instance()
          .creator<UserRepositoryImp>(UserRepositoryImp.instance())
          .getUserModel(userId);
      if (data[mapKey] == successMapkey) {
        printDone("the user model is ${data[mapvalue].user!.fullName!}");
        onChageUserModel(data[mapvalue]);
        isLoading.value = false;
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }
}
