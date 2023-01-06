import 'package:get/get.dart';

class LoginController extends GetxController {
  static final LoginController _loginController = LoginController._internal();
  LoginController._internal();
  static LoginController get instance => _loginController;

  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  onChangeEmail(String value) {
    email.value = value;
  }

  onChangePassword(String value) {
    password.value = value;
  }

  onClickLogin() {}
}
