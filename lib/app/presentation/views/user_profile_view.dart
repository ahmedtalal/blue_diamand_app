import 'package:drinking_app/app/config/screen_handler.dart';
import 'package:drinking_app/app/config/validate_field.dart';
import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/core/utils/widgets/back_shared_widget.dart';
import 'package:drinking_app/app/core/utils/widgets/text_bnt_shared_widget.dart';
import 'package:drinking_app/app/presentation/controllers/user_controller.dart';
import 'package:drinking_app/app/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});
  static final formKey = GlobalKey<FormState>();

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  void initState() {
    super.initState();
    UserController.instance().getUserInfoCon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: ScreenHandler.getScreenHeight(context),
      width: ScreenHandler.getScreenWidth(context),
      padding: const EdgeInsets.all(12),
      margin: EdgeInsets.only(top: ScreenHandler.getScreenHeight(context) / 13),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: GetX<UserController>(
          init: UserController.instance(),
          initState: (state) {
            UserController.instance().getUserInfoCon();
          },
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackSharedWidget(title: "User Profile"),
                SizedBox(
                  height: ScreenHandler.getScreenHeight(context) / 18,
                ),
                controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Form(
                        key: UserProfileView.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormFieldSharedWidget(
                              label: "UserName",
                              hint: "UserName",
                              textType: TextInputType.text,
                              prefIcon: Icons.person,
                              onChangeListenser: controller.onChangeUserName,
                              onValidateListenser: (String? value) {
                                return ValidateField.instance()
                                    .validateField(value!);
                              },
                              initialValue: controller
                                  .userInfoModel.value.user!.username!,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormFieldSharedWidget(
                              label: "Full Name",
                              hint: "Full Name",
                              textType: TextInputType.text,
                              prefIcon: Icons.person,
                              onChangeListenser: controller.onChangeFullName,
                              onValidateListenser: (String? value) {
                                return ValidateField.instance()
                                    .validateField(value!);
                              },
                              initialValue: controller
                                  .userInfoModel.value.user!.fullName!,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormFieldSharedWidget(
                              label: "Email",
                              hint: "email",
                              textType: TextInputType.emailAddress,
                              prefIcon: Icons.email,
                              onChangeListenser: controller.onChangeEmail,
                              onValidateListenser: (String? value) {
                                return ValidateField.instance()
                                    .validateEmail(value!);
                              },
                              initialValue:
                                  controller.userInfoModel.value.user!.email!,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormFieldSharedWidget(
                              label: "call number",
                              hint: "call number",
                              textType: TextInputType.phone,
                              prefIcon: Icons.phone,
                              onChangeListenser: controller.onChangePhone,
                              onValidateListenser: (String? value) {
                                return ValidateField.instance()
                                    .validatePhoneNumber(value);
                              },
                              initialValue: controller
                                  .userInfoModel.value.user!.callNumber!,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormFieldSharedWidget(
                              label: "what's number",
                              hint: "what's number",
                              textType: TextInputType.phone,
                              prefIcon: Icons.phone,
                              onChangeListenser: controller.onChangePhone,
                              onValidateListenser: (String? value) {
                                return ValidateField.instance()
                                    .validatePhoneNumber(value);
                              },
                              initialValue: controller
                                  .userInfoModel.value.user!.whatsappNumber!,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormFieldSharedWidget(
                              label: "nationality",
                              hint: "nationality",
                              textType: TextInputType.text,
                              prefIcon: Icons.public,
                              onChangeListenser: controller.onChangeAdress,
                              onValidateListenser: (String? value) {
                                return ValidateField.instance()
                                    .validateField(value!);
                              },
                              initialValue: controller
                                  .userInfoModel.value.user!.nationality!,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormFieldSharedWidget(
                              label: "emirate city",
                              hint: "emirate city",
                              textType: TextInputType.text,
                              prefIcon: Icons.public,
                              onChangeListenser: controller.onChangeAdress,
                              onValidateListenser: (String? value) {
                                return ValidateField.instance()
                                    .validateField(value!);
                              },
                              initialValue: controller
                                  .userInfoModel.value.user!.emiratesCity!,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormFieldSharedWidget(
                              label: "emirate id",
                              hint: "emirate id",
                              textType: TextInputType.text,
                              prefIcon: Icons.list_alt_rounded,
                              onChangeListenser: controller.onChangeAdress,
                              onValidateListenser: (String? value) {
                                return ValidateField.instance()
                                    .validateField(value!);
                              },
                              initialValue: controller
                                  .userInfoModel.value.user!.emiratesID!,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormFieldSharedWidget(
                              label: "birthdate",
                              hint: "birthdate",
                              textType: TextInputType.text,
                              prefIcon: Icons.date_range,
                              onChangeListenser: controller.onChangeAdress,
                              onValidateListenser: (String? value) {
                                return ValidateField.instance()
                                    .validateField(value!);
                              },
                              initialValue: controller
                                  .userInfoModel.value.user!.birthdate!,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormFieldSharedWidget(
                              label: "area",
                              hint: "area",
                              textType: TextInputType.text,
                              prefIcon: Icons.public,
                              onChangeListenser: controller.onChangeAdress,
                              onValidateListenser: (String? value) {
                                return ValidateField.instance()
                                    .validateField(value!);
                              },
                              initialValue:
                                  controller.userInfoModel.value.user!.area!,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "residentail model",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: appFont,
                                    color: Colors.deepOrange[300],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.onShowResidentailOrNot();
                                  },
                                  child: Icon(
                                    !controller.isVisible.value
                                        ? Icons.arrow_drop_up_outlined
                                        : Icons.arrow_drop_down_outlined,
                                    color: Colors.deepOrange[300],
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            !controller.isVisible.value
                                ? Container()
                                : ResidentailAddressWidget(
                                    controller: controller),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "WorkAdress model",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: appFont,
                                    color: Colors.deepOrange[300],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.onShowWorkAdressOrNot();
                                  },
                                  child: Icon(
                                    !controller.isWorkModelVisible.value
                                        ? Icons.arrow_drop_up_outlined
                                        : Icons.arrow_drop_down_outlined,
                                    color: Colors.deepOrange[300],
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            !controller.isWorkModelVisible.value
                                ? Container()
                                : ResidentailAddressWidget(
                                    controller: controller),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: TextBtnSharedWidget(
                                btnTitle: "Save",
                                btnHeight:
                                    ScreenHandler.getScreenHeight(context) / 17,
                                btnWidth:
                                    ScreenHandler.getScreenWidth(context) / 2,
                                btnColor: AppColor.color1,
                                btnRaduis: 10,
                                onClick: () {},
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    ));
  }
}

class ResidentailAddressWidget extends StatelessWidget {
  const ResidentailAddressWidget({required this.controller, super.key});
  final UserController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: super.key,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextFormFieldSharedWidget(
            label: "street",
            hint: "street",
            textType: TextInputType.text,
            prefIcon: Icons.location_on,
            onChangeListenser: (String? newValue) {},
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: controller
                .userInfoModel.value.user!.residentailAddress!.street!,
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "bidg/vila name",
            hint: "bidg/vila name",
            textType: TextInputType.text,
            prefIcon: Icons.villa,
            onChangeListenser: (String? newValue) {},
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue:
                controller.userInfoModel.value.user!.residentailAddress!.name!,
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "bidg/vila number",
            hint: "bidg/vila number",
            textType: TextInputType.number,
            prefIcon: Icons.villa,
            onChangeListenser: (String? newValue) {},
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: controller
                .userInfoModel.value.user!.residentailAddress!.number
                .toString(),
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "landmark",
            hint: "landmark[e.g.behind xxx school]",
            textType: TextInputType.text,
            prefIcon: Icons.location_on,
            onChangeListenser: (String? newValue) {},
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: controller
                .userInfoModel.value.user!.residentailAddress!.landMark!,
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "type",
            hint: "type[individual/group/family]",
            textType: TextInputType.text,
            prefIcon: Icons.group_add,
            onChangeListenser: (String? newValue) {},
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: controller
                .userInfoModel.value.user!.residentailAddress!.groupType!,
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "name of contact",
            hint: "name of contact person",
            prefIcon: Icons.contact_mail_outlined,
            textType: TextInputType.text,
            onChangeListenser: (String? newValue) {},
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: controller
                .userInfoModel.value.user!.residentailAddress!.contactPerson!,
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "number of person",
            hint: "number of person staying with you",
            textType: TextInputType.number,
            prefIcon: Icons.person,
            onChangeListenser: (String? newValue) {},
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: controller
                .userInfoModel.value.user!.residentailAddress!.personsNumber
                .toString(),
          ),
        ],
      ),
    );
  }
}

class WorkAddressWidget extends StatelessWidget {
  const WorkAddressWidget({required this.controller, super.key});
  final UserController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: super.key,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextFormFieldSharedWidget(
            label: "street",
            hint: "street",
            textType: TextInputType.text,
            prefIcon: Icons.location_on,
            onChangeListenser: (String? newValue) {},
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: controller
                .userInfoModel.value.user!.residentailAddress!.street!,
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "bidg/vila name",
            hint: "bidg/vila name",
            textType: TextInputType.text,
            prefIcon: Icons.villa,
            onChangeListenser: (String? newValue) {},
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue:
                controller.userInfoModel.value.user!.residentailAddress!.name!,
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "bidg/vila number",
            hint: "bidg/vila number",
            textType: TextInputType.number,
            prefIcon: Icons.villa,
            onChangeListenser: (String? newValue) {},
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: controller
                .userInfoModel.value.user!.residentailAddress!.number
                .toString(),
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "landmark",
            hint: "landmark[e.g.behind xxx school]",
            textType: TextInputType.text,
            prefIcon: Icons.location_on,
            onChangeListenser: (String? newValue) {},
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: controller
                .userInfoModel.value.user!.residentailAddress!.landMark!,
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "type",
            hint: "type[individual/group/family]",
            textType: TextInputType.text,
            prefIcon: Icons.group_add,
            onChangeListenser: (String? newValue) {},
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: controller
                .userInfoModel.value.user!.residentailAddress!.groupType!,
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "name of contact",
            hint: "name of contact person",
            prefIcon: Icons.contact_mail_outlined,
            textType: TextInputType.text,
            onChangeListenser: (String? newValue) {},
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: controller
                .userInfoModel.value.user!.residentailAddress!.contactPerson!,
          ),
          const SizedBox(height: 10),
          TextFormFieldSharedWidget(
            label: "number of person",
            hint: "number of person staying with you",
            textType: TextInputType.number,
            prefIcon: Icons.person,
            onChangeListenser: (String? newValue) {},
            onValidateListenser: (String? value) {
              return ValidateField.instance().validateField(value!);
            },
            initialValue: controller
                .userInfoModel.value.user!.residentailAddress!.personsNumber
                .toString(),
          ),
        ],
      ),
    );
  }
}
