import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:flutter/material.dart';

class TextFormFieldSharedWidget extends StatelessWidget {
  final String label, hint, initialValue;
  final dynamic Function(String?) onChangeListenser;
  final String? Function(String?) onValidateListenser;
  final IconData prefIcon;
  final TextInputType textType;
  const TextFormFieldSharedWidget(
      {required this.label,
      required this.hint,
      required this.textType,
      required this.prefIcon,
      required this.onChangeListenser,
      required this.onValidateListenser,
      required this.initialValue,
      Key? key})
      : super(key: key);
  static bool? passwordObscure = true;
  static bool? passwordVisibilty = false;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return TextFormField(
          initialValue: initialValue,
          onChanged: onChangeListenser,
          validator: onValidateListenser,
          keyboardType: textType,
          style: const TextStyle(
            fontFamily: appFont,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            border: textFieldBorder(),
            disabledBorder: textFieldBorder(),
            enabledBorder: textFieldBorder(),
            focusedBorder: textFieldBorder(),
            hintText: hint,
            label: Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: appFont,
              ),
            ),
            hintStyle: const TextStyle(
              fontSize: 14,
              fontFamily: appFont,
              fontWeight: FontWeight.w200,
            ),
            prefixIcon: Icon(
              prefIcon,
              size: 22,
            ),
            suffixIcon: label.toLowerCase().contains("password")
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        passwordObscure = !passwordObscure!;
                        passwordVisibilty = !passwordVisibilty!;
                      });
                    },
                    icon: Icon(
                      passwordVisibilty!
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  )
                : null,
          ),
          obscureText: label.toLowerCase().contains("password")
              ? passwordObscure!
              : false,
          enabled: true,
        );
      },
    );
  }
}

OutlineInputBorder textFieldBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(13),
    borderSide: const BorderSide(
      color: Colors.grey,
      width: 0.8,
    ),
  );
}
