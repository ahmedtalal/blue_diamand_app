import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:drinking_app/app/config/screen_handler.dart';
import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/presentation/controllers/main_view_controller.dart';
import 'package:drinking_app/app/presentation/controllers/theme_controller.dart';
import 'package:drinking_app/app/presentation/widgets/curved_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/strings.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<MainViewController>(
        init: MainViewController.instance,
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: AppColor.color2,
              color: ThemeStorage.instance().getKey()
                  ? AppColor.greyColor
                  : Colors.white,
              buttonBackgroundColor: ThemeStorage.instance().getKey()
                  ? AppColor.greyColor
                  : Colors.white,
              onTap: controller.checkCurrentIndex,
              items: [
                curvedItems(image: homeImg),
                curvedItems(image: productsImg),
                curvedItems(image: offersImg),
                curvedItems(image: notificationImg),
                curvedItems(image: cartImg),
              ],
            ),
            body: SizedBox(
              height: ScreenHandler.getScreenHeight(context),
              width: ScreenHandler.getScreenWidth(context),
              child: controller.curvedItems
                  .elementAt(controller.curvedCurrentIndex.value),
            ),
          );
        });
  }
}
