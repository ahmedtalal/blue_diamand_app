import 'package:drinking_app/app/presentation/controllers/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBindng implements Bindings {
  static final RegisterBindng _registerBindng = RegisterBindng._internal();
  RegisterBindng._internal();
  static RegisterBindng get instance => _registerBindng;
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController.instance,
      fenix: true,
    );
  }
}
