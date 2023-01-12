import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/core/utils/widgets/error__shared_widget.dart';
import 'package:drinking_app/app/data/models/auth_model.dart';
import 'package:drinking_app/app/data/repositories/api/auth_repository_imp.dart';
import 'package:drinking_app/app/domain/entities/auth_entity.dart';
import 'package:drinking_app/app/domain/entities/residential_address.dart';
import 'package:drinking_app/app/domain/entities/work_address.dart';
import 'package:drinking_app/app/domain/usecases/auth/register_usecase.dart';
import 'package:drinking_app/app/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static final RegisterController _registerController =
      RegisterController._internal();
  RegisterController._internal();
  static RegisterController get instance => _registerController;

  var choiceRegisterSection = 1.obs;

  choiceRegisterModel(int registerSectionIndex) {
    choiceRegisterSection.value = registerSectionIndex;
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
  var type = ''.obs;
  var nameOfContact = ''.obs;
  var numberOfPerson = ''.obs;
  var workHouse = ''.obs;
  var contactPerson = ''.obs;
  var staff = ''.obs;
  var lamdaMark = ''.obs;
  var passwprd = ''.obs;
  var isLoading = false.obs;

  onChangeUserName(String newValue) {
    userName.value = newValue;
  }

  onChangeEmail(String newValue) {
    email.value = newValue;
  }

  onChangeDate(String newValue) {
    date.value = newValue;
  }

  onChangeEmiratesId(String newValue) {
    emiratesId.value = newValue;
  }

  onChangeNationality(String newValue) {
    nationality.value = newValue;
  }

  onChangeCallingNumber(String newValue) {
    callingNumber.value = newValue;
  }

  onChangeWhatsAppNumber(String newValue) {
    whatsNumber.value = newValue;
  }

  onChangeEmiratesCity(String newValue) {
    emirateCity.value = newValue;
  }

  onChangeStreet(String newValue) {
    street.value = newValue;
  }

  onChangeVillaName(String newValue) {
    villaName.value = newValue;
  }

  onChangeLamdMark(String newValue) {
    lamdaMark.value = newValue;
  }

  onChangeType(String newValue) {
    type.value = newValue;
  }

  onChangeNameOfContact(String newValue) {
    nameOfContact.value = newValue;
  }

  onChangeNmuberOfPerson(String newValue) {
    numberOfPerson.value = newValue;
  }

  onChangeWorkHouse(String newValue) {
    workHouse.value = newValue;
  }

  onChangeArea(String newValue) {
    userName.value = newValue;
  }

  onChangeContactPerson(String newValue) {
    contactPerson.value = newValue;
  }

  onChangestaff(String newValue) {
    staff.value = newValue;
  }

  onChangeFullName(String newValue) {
    fullName.value = newValue;
  }

  onChangePassword(String newValue) {
    password.value = newValue;
  }

  onClickRegister(GlobalKey<FormState> key) async {
    if (key.currentState!.validate()) {
      isLoading.value = true;
      WorkAddress workAddress = WorkAddress(
        workPlaceName: workHouse.value,
        staffNumbers: int.parse(staff.value),
        contactPerson: contactPerson.value,
      );
      ResidentailAddress residentailAddress = ResidentailAddress(
        street: street.value,
        personsNumber: int.parse(numberOfPerson.value),
        name: villaName.value,
        landMark: lamdaMark.value,
        groupType: type.value,
        contactPerson: contactPerson.value,
      );

      AuthEntity authEntity = AuthModel(
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
      final result = await RegisterUseCase.instance
          .registerCall(authEntity, AuthRepositoryImp.instance);
      if (result[mapKey].toString() == successMapkey) {
        Get.to(
          () => const LoginView(),
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
