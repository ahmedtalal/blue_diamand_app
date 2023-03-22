import 'package:drinking_app/app/config/screen_handler.dart';
import 'package:drinking_app/app/config/validate_field.dart';
import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/core/utils/testing_keys.dart';
import 'package:drinking_app/app/core/utils/widgets/back_shared_widget.dart';
import 'package:drinking_app/app/core/utils/widgets/text_icon_btn_shared_widget.dart';
import 'package:drinking_app/app/presentation/controllers/auth_controller.dart';
import 'package:drinking_app/app/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/state_manager.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenHandler.getScreenHeight(context),
        width: ScreenHandler.getScreenWidth(context),
        padding: const EdgeInsets.all(10),
        child: GetX<AuthController>(
            init: AuthController.instance,
            builder: (controller) {
              //if (controller.isLoading.value) {}
              return Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: ScreenHandler.getScreenHeight(context) / 10,
                    ),
                    const BackSharedWidget(title: ""),
                    SizedBox(
                      height: ScreenHandler.getScreenHeight(context) / 5,
                    ),
                    const Text(
                      "Please enter your valid email to send link to reset your password",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: appFont,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormFieldSharedWidget(
                      key: const ValueKey(TestingKeys.LOGIN_EMAIL_FIELD_KEY),
                      label: AppLocalizations.of(context)!.emailAddress,
                      hint: AppLocalizations.of(context)!.emailAddress,
                      textType: TextInputType.emailAddress,
                      prefIcon: Icons.email,
                      onChangeListenser: controller.onChangeEmail,
                      onValidateListenser: (String? value) {
                        return ValidateField.instance().validateField(value!);
                      },
                      initialValue: "",
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextIconBtnSharedWidget(
                      key: const ValueKey(TestingKeys.LOGIN_BTN_KEY),
                      btnTitle: !controller.isLoading.value
                          ? "Send"
                          : "please wait....",
                      btnHeight: ScreenHandler.getScreenHeight(context) / 13,
                      btnWidth: ScreenHandler.getScreenWidth(context) / 2,
                      btnColor: AppColor.color2,
                      btnRaduis: 12,
                      onClick: () {
                        controller.forgetPasswordCon(formKey);
                      },
                      icon: Icons.navigate_next_outlined,
                      iconColor: Colors.white,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
