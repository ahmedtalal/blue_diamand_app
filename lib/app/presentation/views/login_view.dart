import 'package:drinking_app/app/config/screen_handler.dart';
import 'package:drinking_app/app/config/validate_field.dart';
import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/presentation/controllers/login_controller.dart';
import 'package:drinking_app/app/core/utils/widgets/auth_links_shared_widget.dart';
import 'package:drinking_app/app/presentation/views/main_view.dart';
import 'package:drinking_app/app/presentation/widgets/auth_text_icon_widget.dart';
import 'package:drinking_app/app/presentation/widgets/text_form_field_widget.dart';
import 'package:drinking_app/app/core/utils/widgets/text_icon_btn_shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: AppColor.color1,
        child: Container(
          height: ScreenHandler.getScreenHeight(context),
          width: double.maxFinite,
          margin: EdgeInsets.only(
            top: ScreenHandler.getScreenHeight(context) / 8,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Row(
                    children: const [
                      Text(
                        "BLUE DIAMOND",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: appFont,
                          color: AppColor.color1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Image(
                        image: AssetImage(diamondImg),
                        width: 25,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: appFont,
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(height: ScreenHandler.getScreenHeight(context) / 20),
                  const Text(
                    "Login account",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: appFont,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GetX<LoginController>(
                      init: LoginController.instance,
                      builder: (controller) {
                        if (controller.isLoading.value) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20),
                              const SizedBox(height: 10),
                              TextFormFieldSharedWidget(
                                label: "email",
                                hint: "email",
                                textType: TextInputType.emailAddress,
                                prefIcon: Icons.email,
                                onChangeListenser: (String? newValue) {
                                  controller.onChangeEmail(newValue!);
                                },
                                onValidateListenser: (String? value) {
                                  return ValidateField.instance
                                      .validateField(value!);
                                },
                                initialValue: "",
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: double.maxFinite,
                                padding: const EdgeInsets.all(4),
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {},
                                  child: const Text(
                                    "Forget password ?",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: appFont,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormFieldSharedWidget(
                                label: "password",
                                hint: "password",
                                textType: TextInputType.phone,
                                prefIcon: Icons.lock,
                                onChangeListenser: (String? newValue) {
                                  controller.onChangePassword(newValue!);
                                },
                                onValidateListenser: (String? value) {
                                  return ValidateField.instance
                                      .validatePasswordF(value);
                                },
                                initialValue: "",
                              ),
                              const SizedBox(height: 25),
                              TextIconBtnSharedWidget(
                                btnTitle: "Login",
                                btnHeight:
                                    ScreenHandler.getScreenHeight(context) / 13,
                                btnWidth:
                                    ScreenHandler.getScreenWidth(context) / 2,
                                btnColor: AppColor.color2,
                                btnRaduis: 12,
                                onClick: () {
                                  Get.offAll(() => const MainView());
                                },
                                icon: Icons.navigate_next_outlined,
                                iconColor: Colors.black,
                              ),
                              const SizedBox(height: 8),
                              AuthLinksSharedWidget(
                                onClick: () {
                                  Get.back();
                                },
                                text: "Do not have an account?",
                                textLink: "register",
                              ),
                            ],
                          ),
                        );
                      }),
                  SizedBox(height: ScreenHandler.getScreenHeight(context) / 24),
                  const Center(
                    child: Text(
                      "Or login with",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: appFont,
                        color: AppColor.color1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: AuthTextIconBtnWidget(
                            btnTitle: "Phone Number",
                            btnHeight:
                                ScreenHandler.getScreenHeight(context) / 14,
                            btnWidth:
                                ScreenHandler.getScreenWidth(context) / 0.4,
                            btnColor: AppColor.color2,
                            btnRaduis: 8,
                            onClick: () {},
                            image: phoneImg,
                            fontSize: 15,
                            imgSize: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: AuthTextIconBtnWidget(
                            btnTitle: "Google",
                            btnHeight:
                                ScreenHandler.getScreenHeight(context) / 14,
                            btnWidth:
                                ScreenHandler.getScreenWidth(context) / 1.5,
                            btnColor: AppColor.color1,
                            btnRaduis: 12,
                            onClick: () {},
                            image: googleImg,
                            fontSize: 15,
                            imgSize: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
