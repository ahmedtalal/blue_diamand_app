// ignore_for_file: avoid_print

import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/core/utils/widgets/error__shared_widget.dart';
import 'package:drinking_app/app/data/models/auth_model.dart';
import 'package:drinking_app/app/data/repositories/api/auth_repository_imp.dart';
import 'package:drinking_app/app/data/services/local/user_info_local_Service.dart';
import 'package:drinking_app/app/domain/entities/auth_entity.dart';
import 'package:drinking_app/app/domain/entities/residential_address.dart';
import 'package:drinking_app/app/domain/entities/work_address.dart';
import 'package:drinking_app/app/domain/usecases/auth/check_user_login_usecase.dart';
import 'package:drinking_app/app/domain/usecases/auth/register_usecase.dart';
import 'package:drinking_app/app/domain/usecases/user_local_storage/save_user_info_in_local_storage.dart';
import 'package:drinking_app/app/presentation/routes/app_routes.dart';
import 'package:drinking_app/app/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/usecases/auth/login_usecase.dart';
import '../views/home_view.dart';

class AuthController extends GetxController {
  static final AuthController _authController = AuthController._internal();
  AuthController._internal();
  static AuthController get instance => _authController;

  var choiceRegisterSection = 1.obs;

  choiceRegisterModel(int registerSectionIndex, GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      choiceRegisterSection.value = registerSectionIndex;
    }
  }

  var userName = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var fullName = ''.obs;
  var date = ''.obs;
  var emiratesId = ''.obs;
  var nationality = ''.obs;
  var callingNumber = ''.obs;
  var whatsNumber = ''.obs;
  var emirateCity = ''.obs;
  var area = ''.obs;
  var street = ''.obs;
  var villaName = ''.obs;
  var villaNumber = ''.obs;
  var type = ''.obs;
  var nameOfContact = ''.obs;
  var numberOfPerson = ''.obs;
  var workHouse = ''.obs;
  var workPlaceNumber = ''.obs;
  var contactPerson = ''.obs;
  var staff = ''.obs;
  var landMark = ''.obs;

  var isLoading = false.obs;

  onChangeUserName(String? newValue) {
    userName.value = newValue!;
  }

  onChangeEmail(String? newValue) {
    email.value = newValue!;
  }

  onChangeDate(String? newValue) {
    date.value = newValue!;
  }

  onChangeEmiratesId(String? newValue) {
    emiratesId.value = newValue!;
  }

  onChangeNationality(String? newValue) {
    nationality.value = newValue!;
  }

  onChangeCallingNumber(String? newValue) {
    callingNumber.value = newValue!;
  }

  onChangeWhatsAppNumber(String? newValue) {
    whatsNumber.value = newValue!;
  }

  onChangeEmiratesCity(String? newValue) {
    emirateCity.value = newValue!;
  }

  onChangeStreet(String? newValue) {
    street.value = newValue!;
  }

  onChangeVillaName(String? newValue) {
    villaName.value = newValue!;
  }

  onChangeLandMark(String? newValue) {
    landMark.value = newValue!;
  }

  onChangeType(String? newValue) {
    type.value = newValue!;
  }

  onChangeNameOfContact(String? newValue) {
    nameOfContact.value = newValue!;
  }

  onChangeNumberOfPerson(String? newValue) {
    numberOfPerson.value = newValue!;
  }

  onChangeWorkHouse(String? newValue) {
    workHouse.value = newValue!;
  }

  onChangeArea(String? newValue) {
    area.value = newValue!;
  }

  onChangeContactPerson(String? newValue) {
    contactPerson.value = newValue!;
  }

  onChangeStaff(String? newValue) {
    staff.value = newValue!;
  }

  onChangeFullName(String? newValue) {
    fullName.value = newValue!;
  }

  onChangePassword(String? newValue) {
    password.value = newValue!;
  }

  onChangeVillaNumber(String? newValue) {
    villaNumber.value = newValue!;
  }

  onChangeWorkPlaceNumber(String? newValue) {
    workPlaceNumber.value = newValue!;
  }

  onClickRegister(GlobalKey<FormState> key) async {
    if (key.currentState!.validate()) {
      isLoading.value = true;
      final result = await RegisterUseCase.instance
          .registerCall(prepareModel(), AuthRepositoryImp.instance);
      if (result[mapKey].toString() == successMapkey) {
        print("the response body is ${result[mapvalue].toString()}");
        // this line to save user info in local storage
        await SaveUserInfoLocalStorage.instance().call(result);
        isLoading.value = false;
      } else {
        isLoading.value = false;
        print("the error is ${result[mapvalue].toString()}");
        showErrorDialog(
          result[mapvalue],
          "auth exception",
        );
      }
    }
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

  String checkUserIsLoginController() {
    return CheckUserLoginUserCase.instance().call()
        ? AppRoutes.mainViewRoute
        : AppRoutes.splashScreenViewRout;
  }

  AuthEntity prepareModel() {
    WorkAddress workAddress = WorkAddress(
      workPlaceName: workHouse.value,
      workPlaceNameNumber: int.parse(workPlaceNumber.value),
      staffNumbers: int.parse(staff.value),
      contactPerson: contactPerson.value,
    );
    ResidentailAddress residentailAddress = ResidentailAddress(
      street: street.value,
      number: int.parse(villaNumber.value),
      personsNumber: int.parse(numberOfPerson.value),
      name: villaName.value,
      landMark: landMark.value,
      groupType: type.value,
      contactPerson: contactPerson.value,
    );

    return AuthModel(
      fullName: fullName.value,
      email: email.value,
      password: password.value,
      username: userName.value,
      birthdate: date.value,
      emiratesID: emiratesId.value,
      nationality: nationality.value,
      emiratesCity: emirateCity.value,
      area: area.value,
      callNumber: callingNumber.value,
      whatsappNumber: whatsNumber.value,
      workAddress: workAddress,
      residentailAddress: residentailAddress,
    );
  }
}