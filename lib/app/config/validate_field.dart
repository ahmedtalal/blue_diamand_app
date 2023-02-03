class ValidateField {
  static ValidateField? _validateField;
  ValidateField._internal();
  static ValidateField instance() {
    if (_validateField == null) {
      return _validateField = ValidateField._internal();
    }
    return _validateField!;
  }

  String? validateField(String value) {
    if (value.isEmpty) {
      return "this field is required";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "this field is required";
    } else if (!value.contains("@") || !value.contains("com")) {
      return "the formate is wrong";
    }
    return null;
  }

  // this code to validate any phone number
  String? validatePhoneNumber(String? newValue) {
    String phoneNumberPattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp phoneRegExp = RegExp(phoneNumberPattern);
    if (newValue!.isEmpty) {
      return "this field is required";
    } else if (!phoneRegExp.hasMatch(newValue)) {
      return "Please enter valid phone number";
    }
    return null;
  }

  String? validatePassword(String? newValue) {
    if (newValue!.isEmpty) {
      return "this field is required";
    } else if (newValue.length < 5 && !newValue.contains(RegExp(r'[A-Z]'))) {
      return "weak password or must contain numbers and letters and @,#";
    }
    return null;
  }

  String? validateEmirateId(String? newValue) {
    if (newValue!.isEmpty) {
      return "this field is required";
    } else if (newValue.length != 15) {
      return "the length of id must be equal 15 numbers";
    } else {
      return null;
    }
  }
}
