import 'package:drinking_app/app/config/screen_handler.dart';
import 'package:drinking_app/app/config/validate_field.dart';
import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/widgets/back_shared_widget.dart';
import 'package:drinking_app/app/core/utils/widgets/text_bnt_shared_widget.dart';
import 'package:drinking_app/app/presentation/controllers/auth_controller.dart';
import 'package:drinking_app/app/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  static var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenHandler.getScreenHeight(context),
        width: ScreenHandler.getScreenWidth(context),
        padding: const EdgeInsets.all(12),
        margin: EdgeInsets.only(
          top: ScreenHandler.getScreenHeight(context) / 15,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: GetBuilder<AuthController>(
              init: AuthController.instance,
              builder: (controller) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BackSharedWidget(
                      title: "Change Password",
                    ),
                    SizedBox(
                      height: ScreenHandler.getScreenHeight(context) / 15,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormFieldSharedWidget(
                            label: "Old Password",
                            hint: "Old Password",
                            textType: TextInputType.visiblePassword,
                            prefIcon: Icons.lock,
                            onChangeListenser: (String? newValue) {
                              ValidateField.instance()
                                  .validatePassword(newValue);
                            },
                            onValidateListenser: (String? value) {
                              return controller.onChangePassword(value);
                            },
                            initialValue: "",
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormFieldSharedWidget(
                            label: "New Password",
                            hint: "New Password",
                            textType: TextInputType.visiblePassword,
                            prefIcon: Icons.lock,
                            onChangeListenser: (String? newValue) {
                              ValidateField.instance()
                                  .validatePassword(newValue);
                            },
                            onValidateListenser: (String? value) {
                              return controller.onChangeNewPassword(value);
                            },
                            initialValue: "",
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormFieldSharedWidget(
                            label: "confirm Password",
                            hint: "confirm Password",
                            textType: TextInputType.visiblePassword,
                            prefIcon: Icons.lock,
                            onChangeListenser: (String? newValue) {
                              ValidateField.instance()
                                  .validatePassword(newValue);
                            },
                            onValidateListenser: (String? value) {
                              return controller.onChangeConfirmPassword(value);
                            },
                            initialValue: "",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: TextBtnSharedWidget(
                              btnTitle: !controller.isLoading.value
                                  ? "Change"
                                  : "please wait....",
                              btnHeight:
                                  ScreenHandler.getScreenHeight(context) / 17,
                              btnWidth:
                                  ScreenHandler.getScreenWidth(context) / 2,
                              btnColor: AppColor.color1,
                              btnRaduis: 10,
                              onClick: () {
                                controller.changePasswordCon(formKey);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
