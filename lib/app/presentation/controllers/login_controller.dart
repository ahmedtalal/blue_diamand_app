import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/core/utils/widgets/error__shared_widget.dart';
import 'package:drinking_app/app/data/models/auth_model.dart';
import 'package:drinking_app/app/data/repositories/api/auth_repository_imp.dart';
import 'package:drinking_app/app/domain/entities/auth_entity.dart';
import 'package:drinking_app/app/domain/usecases/auth/login_usecase.dart';
import 'package:drinking_app/app/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
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

  onClickLogin(GlobalKey<FormState> key) async {
    if (key.currentState!.validate()) {
      AuthEntity authEntity = AuthModel(
        email: email.value,
        password: password.value,
      );
      isLoading.value = true;
      final result = await LoginUseCase.instance()
          .loginCall(authEntity, AuthRepositoryImp.instance);
      if (result[mapKey].toString() == successMapkey) {
        Get.offAll(
          () => const HomeView(),
        );
        isLoading.value = false;
      } else {
        isLoading.value = false;
        showErrorDialog(
          result[mapvalue],
          "auth exception",
        );
      }
    }
  }
}

class Animal {
  displayAnimal() {
    print("this is animal");
  }
}

class Voice {
  talk() {
    print("this is talk");
  }
}

class Cat extends Animal with Voice {
  @override
  talk() {
    print("this is cat talk");
    return super.talk();
  }
}
