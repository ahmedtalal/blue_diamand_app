import 'package:drinking_app/app/presentation/controllers/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  static final LoginBinding _loginBinding = LoginBinding._internal();
  LoginBinding._internal();
  static LoginBinding get instnace => _loginBinding;

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController.instance, fenix: true);
  }
}
