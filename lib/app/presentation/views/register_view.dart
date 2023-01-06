import 'package:drinking_app/app/config/screen_handler.dart';
import 'package:drinking_app/app/config/validate_field.dart';
import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/presentation/controllers/login/login_binding.dart';
import 'package:drinking_app/app/presentation/controllers/register/register_controller.dart';
import 'package:drinking_app/app/presentation/views/login_view.dart';
import 'package:drinking_app/app/presentation/widgets/auth_links_shared_widget.dart';
import 'package:drinking_app/app/presentation/widgets/text_form_field_widget.dart';
import 'package:drinking_app/app/presentation/widgets/text_icon_btn_shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                    "Registet account",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: appFont,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GetX<RegisterController>(builder: (controller) {
                    if (controller.choiceRegisterSection.value == 1) {
                      return RegisterInformationModel(
                        formKey: formKey,
                        controller: controller,
                      );
                    } else if (controller.choiceRegisterSection.value == 2) {
                      return RegisterResidentialAddressModel(
                        formKey: formKey,
                        controller: controller,
                      );
                    } else {
                      return RegisterWorkAdressModel(
                        formKey: formKey,
                        controller: controller,
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterInformationModel extends StatelessWidget {
  const RegisterInformationModel({
    Key? key,
    required this.formKey,
    required this.controller,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "(Information)",
            style: TextStyle(
              fontSize: 25,
              fontFamily: appFont,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          TextFormFieldSharedWidget(
            label: "full Name",
            hint: "enter full name",
            textType: TextInputType.text,
            prefIcon: Icons.person,
            onChangeListenser: (String? newValue) {
              controller.onChangeFullName(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "date",
            hint: "enter the date",
            textType: TextInputType.datetime,
            prefIcon: Icons.date_range,
            onChangeListenser: (String? newValue) {
              controller.onChangeDate(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "emirates i'd",
            hint: "enter the id",
            textType: TextInputType.text,
            prefIcon: Icons.list_alt_rounded,
            onChangeListenser: (String? newValue) {
              controller.emiratesId(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "nationality",
            hint: "nationality",
            textType: TextInputType.text,
            prefIcon: Icons.public,
            onChangeListenser: (String? newValue) {
              controller.onChangeNationality(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "email address",
            hint: "email address",
            textType: TextInputType.emailAddress,
            prefIcon: Icons.public,
            onChangeListenser: (String? newValue) {
              controller.onChangeEmail(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "calling number",
            hint: "calling number",
            textType: TextInputType.phone,
            prefIcon: Icons.public,
            onChangeListenser: (String? newValue) {
              controller.onChangeCallingNumber(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validatePhoneNumber(value);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "what'sapp number",
            hint: "what'sapp  number",
            textType: TextInputType.phone,
            prefIcon: Icons.public,
            onChangeListenser: (String? newValue) {
              controller.onChangeWhatsAppNumber(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validatePhoneNumber(value);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "emirates city",
            hint: "emirates city",
            textType: TextInputType.text,
            prefIcon: Icons.public,
            onChangeListenser: (String? newValue) {
              controller.onChangeEmiratesCity(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "area",
            hint: "area",
            textType: TextInputType.text,
            prefIcon: Icons.location_on_sharp,
            onChangeListenser: (String? newValue) {
              controller.onChangeArea(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextIconBtnSharedWidget(
            btnTitle: "Next step",
            btnHeight: ScreenHandler.getScreenHeight(context) / 13,
            btnWidth: ScreenHandler.getScreenWidth(context) / 2,
            btnColor: AppColor.color2,
            btnRaduis: 12,
            onClick: () {
              controller.choiceRegisterSection.value = 2;
            },
            icon: Icons.navigate_next_outlined,
            iconColor: Colors.black,
          ),
          const SizedBox(height: 8),
          AuthLinksSharedWidget(
            onClick: () {
              Get.to(
                () => const LoginView(),
                binding: LoginBinding.instnace,
              );
            },
            text: "Already have an account?",
            textLink: "login",
          ),
        ],
      ),
    );
  }
}

class RegisterResidentialAddressModel extends StatelessWidget {
  const RegisterResidentialAddressModel({
    Key? key,
    required this.formKey,
    required this.controller,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "(Residential Address)",
            style: TextStyle(
              fontSize: 25,
              fontFamily: appFont,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          TextFormFieldSharedWidget(
            label: "street",
            hint: "street",
            textType: TextInputType.text,
            prefIcon: Icons.location_on,
            onChangeListenser: (String? newValue) {
              controller.onChangeStreet(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "bidg/vila name",
            hint: "bidg/vila name",
            textType: TextInputType.datetime,
            prefIcon: Icons.villa,
            onChangeListenser: (String? newValue) {
              controller.onChangeVillaName(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "lamdmark",
            hint: "lamdmark[e.g.behind xxx school]",
            textType: TextInputType.text,
            prefIcon: Icons.location_on,
            onChangeListenser: (String? newValue) {
              controller.onChangeLamdMark(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "type",
            hint: "type[individual/group/family]",
            textType: TextInputType.emailAddress,
            prefIcon: Icons.group_add,
            onChangeListenser: (String? newValue) {
              controller.onChangeType(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "name of contact",
            hint: "name of contact person",
            textType: TextInputType.phone,
            prefIcon: Icons.contact_mail_outlined,
            onChangeListenser: (String? newValue) {
              controller.onChangeNameOfContact(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "number of persopn",
            hint: "number of person staying with you",
            textType: TextInputType.text,
            prefIcon: Icons.person,
            onChangeListenser: (String? newValue) {
              controller.onChangeNmuberOfPerson(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextIconBtnSharedWidget(
                  btnTitle: "Back",
                  btnHeight: ScreenHandler.getScreenHeight(context) / 13,
                  btnWidth: ScreenHandler.getScreenWidth(context) / 2,
                  btnColor: Colors.red,
                  btnRaduis: 12,
                  onClick: () {
                    controller.choiceRegisterSection.value = 1;
                  },
                  icon: Icons.navigate_next_outlined,
                  iconColor: Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextIconBtnSharedWidget(
                  btnTitle: "Next step",
                  btnHeight: ScreenHandler.getScreenHeight(context) / 13,
                  btnWidth: ScreenHandler.getScreenWidth(context) / 2,
                  btnColor: AppColor.color2,
                  btnRaduis: 12,
                  onClick: () {
                    controller.choiceRegisterSection.value = 3;
                  },
                  icon: Icons.navigate_next_outlined,
                  iconColor: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          AuthLinksSharedWidget(
            onClick: () {
              Get.to(
                () => const LoginView(),
                binding: LoginBinding.instnace,
              );
            },
            text: "Already have an account?",
            textLink: "login",
          ),
        ],
      ),
    );
  }
}

class RegisterWorkAdressModel extends StatelessWidget {
  const RegisterWorkAdressModel({
    Key? key,
    required this.formKey,
    required this.controller,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "(WorkAdressModel)",
            style: TextStyle(
              fontSize: 25,
              fontFamily: appFont,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          TextFormFieldSharedWidget(
            label: "workhouse",
            hint: "shop/office/workhouse number",
            textType: TextInputType.text,
            prefIcon: Icons.shop,
            onChangeListenser: (String? newValue) {
              controller.onChangeWorkHouse(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "contact person",
            hint: "contact person name",
            textType: TextInputType.datetime,
            prefIcon: Icons.contact_mail,
            onChangeListenser: (String? newValue) {
              controller.onChangeContactPerson(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "staff",
            hint: "number of staff",
            textType: TextInputType.text,
            prefIcon: Icons.group,
            onChangeListenser: (String? newValue) {
              controller.onChangestaff(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "username",
            hint: "username",
            textType: TextInputType.emailAddress,
            prefIcon: Icons.person,
            onChangeListenser: (String? newValue) {
              controller.onChangeUserName(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance.validateField(value!);
            },
            initialValue: "",
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
              return ValidateField.instance.validatePasswordF(value);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextIconBtnSharedWidget(
                  btnTitle: "Back",
                  btnHeight: ScreenHandler.getScreenHeight(context) / 13,
                  btnWidth: ScreenHandler.getScreenWidth(context) / 2,
                  btnColor: Colors.red,
                  btnRaduis: 12,
                  onClick: () {
                    controller.choiceRegisterSection.value = 2;
                    //Get.to(() => const RegisterView());
                  },
                  icon: Icons.navigate_next_outlined,
                  iconColor: Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextIconBtnSharedWidget(
                  btnTitle: "Register",
                  btnHeight: ScreenHandler.getScreenHeight(context) / 13,
                  btnWidth: ScreenHandler.getScreenWidth(context) / 2,
                  btnColor: AppColor.color2,
                  btnRaduis: 12,
                  onClick: () {},
                  icon: Icons.navigate_next_outlined,
                  iconColor: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          AuthLinksSharedWidget(
            onClick: () {
              Get.to(
                () => const LoginView(),
                binding: LoginBinding.instnace,
              );
            },
            text: "Already have an account?",
            textLink: "login",
          ),
        ],
      ),
    );
  }
}
