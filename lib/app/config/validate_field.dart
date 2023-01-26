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

  String? validatePhoneNumber(String? newValue) {
    if (newValue!.isEmpty) {
      return "this field is required";
    } else if (newValue.length != 11 || newValue.contains(RegExp(r'[A-Z]'))) {
      return "your phone is not validate and may be wrong ";
    } else if (newValue.substring(0, 3) == "011" ||
        newValue.substring(0, 3) == "012" ||
        newValue.substring(0, 3) == "015" ||
        newValue.substring(0, 3) == "010") {
      return null;
    }
    return null;
  }

  String? validatePasswordF(String? newValue) {
    if (newValue!.isEmpty) {
      return "this field is required";
    } else if (newValue.length != 5 && !newValue.contains(RegExp(r'[A-Z]'))) {
      return "weak password or must contain numbers and letters and @,#";
    }
    return null;
  }
}
