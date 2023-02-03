import 'package:drinking_app/app/config/screen_handler.dart';
import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/core/utils/widgets/back_shared_widget.dart';
import 'package:drinking_app/app/core/utils/widgets/text_bnt_shared_widget.dart';
import 'package:drinking_app/app/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});
  static final formKey = GlobalKey<FormState>();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackSharedWidget(title: "User Profile"),
            SizedBox(
              height: ScreenHandler.getScreenHeight(context) / 12,
            ),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[200],
                    child: const ClipOval(
                      child: Image(
                        image: AssetImage(
                          userImg,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {},
                      child: const Image(
                        image: AssetImage(
                          cameraBtn,
                        ),
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenHandler.getScreenHeight(context) / 13,
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormFieldSharedWidget(
                    label: "UserName",
                    hint: "User Name",
                    textType: TextInputType.text,
                    prefIcon: Icons.person,
                    onChangeListenser: (String? newValue) {},
                    onValidateListenser: (String? value) {},
                    initialValue: "",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormFieldSharedWidget(
                    label: "Full Name",
                    hint: "Full Name",
                    textType: TextInputType.text,
                    prefIcon: Icons.person,
                    onChangeListenser: (String? newValue) {},
                    onValidateListenser: (String? value) {},
                    initialValue: "",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormFieldSharedWidget(
                    label: "Email",
                    hint: "email",
                    textType: TextInputType.emailAddress,
                    prefIcon: Icons.email,
                    onChangeListenser: (String? newValue) {},
                    onValidateListenser: (String? value) {},
                    initialValue: "",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormFieldSharedWidget(
                    label: "phone",
                    hint: "phone",
                    textType: TextInputType.phone,
                    prefIcon: Icons.phone,
                    onChangeListenser: (String? newValue) {},
                    onValidateListenser: (String? value) {},
                    initialValue: "",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormFieldSharedWidget(
                    label: "address",
                    hint: "address",
                    textType: TextInputType.streetAddress,
                    prefIcon: Icons.location_city,
                    onChangeListenser: (String? newValue) {},
                    onValidateListenser: (String? value) {},
                    initialValue: "",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TextBtnSharedWidget(
                      btnTitle: "Save",
                      btnHeight: ScreenHandler.getScreenHeight(context) / 17,
                      btnWidth: ScreenHandler.getScreenWidth(context) / 2,
                      btnColor: AppColor.color1,
                      btnRaduis: 10,
                      onClick: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
