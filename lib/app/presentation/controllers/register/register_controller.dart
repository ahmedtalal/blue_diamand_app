import 'package:get/state_manager.dart';

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
  var lamdMark = ''.obs;
  var passwod = ''.obs;
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
    lamdMark.value = newValue;
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

  onClickRegister() {}
}
