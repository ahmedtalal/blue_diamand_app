import 'package:drinking_app/app/config/screen_handler.dart';
import 'package:drinking_app/app/config/validate_field.dart';
import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/presentation/controllers/auth_controller.dart';
import 'package:drinking_app/app/presentation/views/login_view.dart';
import 'package:drinking_app/app/core/utils/widgets/auth_links_shared_widget.dart';
import 'package:drinking_app/app/presentation/widgets/text_form_field_widget.dart';
import 'package:drinking_app/app/core/utils/widgets/text_icon_btn_shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/services/local/theme_local_Storage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
            color: ThemeStorage.instance().getKey()
                ? Colors.black54
                : Colors.white,
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
                    children: [
                      Text(
                        AppLocalizations.of(context)!.blueDiamond,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: appFont,
                          color: AppColor.color1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Image(
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
                    ),
                  ),
                  SizedBox(height: ScreenHandler.getScreenHeight(context) / 20),
                  Text(
                    AppLocalizations.of(context)!.registerAccount,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: appFont,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GetX<AuthController>(
                    init: AuthController.instance,
                    builder: (controller) {
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
                        return RegisterWorkAddressModel(
                          formKey: formKey,
                          controller: controller,
                        );
                      }
                    },
                  ),
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
  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.information,
            style: const TextStyle(
              fontSize: 25,
              fontFamily: appFont,
            ),
          ),
          const SizedBox(height: 20),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.fullName,
            hint: AppLocalizations.of(context)!.pleaseEnterFullName,
            textType: TextInputType.text,
            prefIcon: Icons.person,
            onChangeListenser: (String? newValue) {
              controller.onChangeFullName(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.date,
            hint: AppLocalizations.of(context)!.enterTheDate,
            textType: TextInputType.datetime,
            prefIcon: Icons.date_range,
            onChangeListenser: (String? newValue) {
              controller.onChangeDate(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.emiratesId,
            hint: AppLocalizations.of(context)!.emiratesId,
            textType: TextInputType.number,
            prefIcon: Icons.list_alt_rounded,
            onChangeListenser: (String? newValue) {
              controller.emiratesId(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateEmirateId(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.nationality,
            hint: AppLocalizations.of(context)!.nationality,
            textType: TextInputType.text,
            prefIcon: Icons.public,
            onChangeListenser: (String? newValue) {
              controller.onChangeNationality(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
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
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.callingNumber,
            hint: AppLocalizations.of(context)!.callingNumber,
            textType: TextInputType.phone,
            prefIcon: Icons.phone,
            onChangeListenser: (String? newValue) {
              controller.onChangeCallingNumber(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validatePhoneNumber(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.whatsAppNumber,
            hint: AppLocalizations.of(context)!.whatsAppNumber,
            textType: TextInputType.phone,
            prefIcon: Icons.phone,
            onChangeListenser: (String? newValue) {
              controller.onChangeWhatsAppNumber(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validatePhoneNumber(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.emiratesCity,
            hint: AppLocalizations.of(context)!.emiratesCity,
            textType: TextInputType.text,
            prefIcon: Icons.location_city,
            onChangeListenser: (String? newValue) {
              controller.onChangeEmiratesCity(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.area,
            hint: AppLocalizations.of(context)!.area,
            textType: TextInputType.text,
            prefIcon: Icons.location_on_sharp,
            onChangeListenser: (String? newValue) {
              controller.onChangeArea(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextIconBtnSharedWidget(
            btnTitle: AppLocalizations.of(context)!.nextStep,
            btnHeight: ScreenHandler.getScreenHeight(context) / 13,
            btnWidth: ScreenHandler.getScreenWidth(context) / 2,
            btnColor: AppColor.color2,
            btnRaduis: 12,
            onClick: () {
              //controller.choiceRegisterSection.value = 2;
              controller.choiceRegisterModel(2, formKey);
            },
            icon: Icons.navigate_next_outlined,
            iconColor: Colors.white,
          ),
          const SizedBox(height: 8),
          AuthLinksSharedWidget(
            onClick: () {
              Get.to(
                () => const LoginView(),
              );
            },
            text: AppLocalizations.of(context)!.alreadyHaveAnAccount,
            textLink: AppLocalizations.of(context)!.login,
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
  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.residentialAddress,
            style: const TextStyle(
              fontSize: 25,
              fontFamily: appFont,
            ),
          ),
          const SizedBox(height: 20),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.street,
            hint: AppLocalizations.of(context)!.street,
            textType: TextInputType.text,
            prefIcon: Icons.location_on,
            onChangeListenser: (String? newValue) {
              controller.onChangeStreet(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.vilaName,
            hint: AppLocalizations.of(context)!.vilaName,
            textType: TextInputType.text,
            prefIcon: Icons.villa,
            onChangeListenser: (String? newValue) {
              controller.onChangeVillaName(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.villaNumber,
            hint: AppLocalizations.of(context)!.villaNumber,
            textType: TextInputType.number,
            prefIcon: Icons.villa,
            onChangeListenser: (String? newValue) {
              controller.onChangeVillaNumber(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.landMark,
            hint: AppLocalizations.of(context)!.landmarkType,
            textType: TextInputType.text,
            prefIcon: Icons.location_on,
            onChangeListenser: (String? newValue) {
              controller.onChangeLandMark(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.type,
            hint: AppLocalizations.of(context)!.typeEx,
            textType: TextInputType.text,
            prefIcon: Icons.group_add,
            onChangeListenser: (String? newValue) {
              controller.onChangeType(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.nameOfContact,
            hint: AppLocalizations.of(context)!.nameOfContact,
            prefIcon: Icons.contact_mail_outlined,
            textType: TextInputType.text,
            onChangeListenser: (String? newValue) {
              controller.onChangeNameOfContact(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.numberOfPerson,
            hint: AppLocalizations.of(context)!.numberOfPerson,
            textType: TextInputType.number,
            prefIcon: Icons.person,
            onChangeListenser: (String? newValue) {
              controller.onChangeNumberOfPerson(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextIconBtnSharedWidget(
                  btnTitle: AppLocalizations.of(context)!.area,
                  btnHeight: ScreenHandler.getScreenHeight(context) / 13,
                  btnWidth: ScreenHandler.getScreenWidth(context) / 2,
                  btnColor: AppColor.color1,
                  btnRaduis: 12,
                  onClick: () {
                    controller.choiceRegisterSection.value = 1;
                  },
                  icon: Icons.keyboard_arrow_left_outlined,
                  iconColor: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextIconBtnSharedWidget(
                  btnTitle: AppLocalizations.of(context)!.nextStep,
                  btnHeight: ScreenHandler.getScreenHeight(context) / 13,
                  btnWidth: ScreenHandler.getScreenWidth(context) / 2,
                  btnColor: AppColor.color2,
                  btnRaduis: 12,
                  onClick: () {
                    // controller.choiceRegisterSection.value = 3;
                    controller.choiceRegisterModel(3, formKey);
                  },
                  icon: Icons.navigate_next_outlined,
                  iconColor: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          AuthLinksSharedWidget(
            onClick: () {
              Get.to(
                () => const LoginView(),
              );
            },
            text: AppLocalizations.of(context)!.alreadyHaveAnAccount,
            textLink: AppLocalizations.of(context)!.area,
          ),
        ],
      ),
    );
  }
}

class RegisterWorkAddressModel extends StatelessWidget {
  const RegisterWorkAddressModel({
    Key? key,
    required this.formKey,
    required this.controller,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.workAddressModel,
            style: const TextStyle(
              fontSize: 25,
              fontFamily: appFont,
            ),
          ),
          const SizedBox(height: 20),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.workhouse,
            hint: AppLocalizations.of(context)!.workhouse,
            textType: TextInputType.text,
            prefIcon: Icons.shop,
            onChangeListenser: (String? newValue) {
              controller.onChangeWorkHouse(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 20),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.workhouseNumber,
            hint: AppLocalizations.of(context)!.workhouseNumber,
            textType: TextInputType.number,
            prefIcon: Icons.shop,
            onChangeListenser: (String? newValue) {
              controller.onChangeWorkPlaceNumber(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.nameOfContact,
            hint: AppLocalizations.of(context)!.nameOfContact,
            textType: TextInputType.text,
            prefIcon: Icons.contact_mail,
            onChangeListenser: (String? newValue) {
              controller.onChangeContactPerson(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.staff,
            hint: AppLocalizations.of(context)!.staff,
            textType: TextInputType.number,
            prefIcon: Icons.group,
            onChangeListenser: (String? newValue) {
              controller.onChangeStaff(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.username,
            hint: AppLocalizations.of(context)!.username,
            textType: TextInputType.text,
            prefIcon: Icons.person,
            onChangeListenser: (String? newValue) {
              controller.onChangeUserName(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: AppLocalizations.of(context)!.password,
            hint: AppLocalizations.of(context)!.password,
            textType: TextInputType.visiblePassword,
            prefIcon: Icons.lock,
            onChangeListenser: (String? newValue) {
              controller.onChangePassword(newValue!);
            },
            onValidateListenser: (String? value) {
              return ValidateField.instance().validatePassword(value);
            },
            initialValue: "",
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextIconBtnSharedWidget(
                  btnTitle: AppLocalizations.of(context)!.back,
                  btnHeight: ScreenHandler.getScreenHeight(context) / 13,
                  btnWidth: ScreenHandler.getScreenWidth(context) / 2,
                  btnColor: AppColor.color1,
                  btnRaduis: 12,
                  onClick: () {
                    controller.choiceRegisterSection.value = 2;
                  },
                  icon: Icons.keyboard_arrow_left_outlined,
                  iconColor: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: controller.isLoading.value == false
                    ? TextIconBtnSharedWidget(
                        btnTitle: !controller.isLoading.value
                            ? AppLocalizations.of(context)!.register1
                            : "please wait....",
                        btnHeight: ScreenHandler.getScreenHeight(context) / 13,
                        btnWidth: ScreenHandler.getScreenWidth(context) / 2,
                        btnColor: AppColor.color2,
                        btnRaduis: 12,
                        onClick: () {
                          controller.onClickRegister(formKey);
                        },
                        icon: Icons.navigate_next_outlined,
                        iconColor: Colors.white,
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          AuthLinksSharedWidget(
            onClick: () {
              Get.to(
                () => const LoginView(),
              );
            },
            text: AppLocalizations.of(context)!.alreadyHaveAnAccount,
            textLink: AppLocalizations.of(context)!.login,
          ),
        ],
      ),
    );
  }
}
