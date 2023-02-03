import 'package:drinking_app/app/config/screen_handler.dart';
import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/core/utils/widgets/back_shared_widget.dart';
import 'package:drinking_app/app/presentation/views/change_password_view.dart';
import 'package:drinking_app/app/presentation/widgets/setting_model_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenHandler.getScreenHeight(context),
        width: ScreenHandler.getScreenWidth(context),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenHandler.getScreenHeight(context) / 12,
            ),
            const BackSharedWidget(title: "Settings"),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: ScreenHandler.getScreenHeight(context) / 7,
              width: ScreenHandler.getScreenWidth(context),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.color5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
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
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Ahmed Talal",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: appFont,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "AhmedTalal@gmail.com",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: appFont,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  SettingModelWidget(
                    title: "Dark Mode",
                    icon: Icons.light_mode,
                    color: AppColor.color5,
                    onClick: () {}, // NOT USED !!!!!!!!!!!!!
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SettingModelWidget(
                    title: "Change Language",
                    icon: Icons.language,
                    color: AppColor.color6,
                    onClick: () {},
                  ),
                  SettingModelWidget(
                    title: "Change Password",
                    icon: Icons.lock_reset,
                    color: AppColor.color1,
                    onClick: () {
                      Get.to(() => const ChangePasswordView());
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      SettingModelWidget(
                        title: "privacy",
                        icon: Icons.policy,
                        color: AppColor.color2,
                        onClick: () {},
                      ),
                      SettingModelWidget(
                        title: "about",
                        icon: Icons.error,
                        color: AppColor.color4,
                        onClick: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SettingModelWidget(
                    title: "LogOut",
                    icon: Icons.logout,
                    color: AppColor.color5,
                    onClick: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
