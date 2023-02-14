import 'package:drinking_app/app/presentation/controllers/auth_controller.dart';
import 'package:drinking_app/app/presentation/controllers/theme_controller.dart';
import 'package:drinking_app/app/presentation/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const DrinkApp());
}

class DrinkApp extends StatelessWidget {
  const DrinkApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController.instance(),
      builder: (controller) {
        return GetBuilder<AuthController>(
            init: AuthController.instance,
            builder: (authController) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: authController.checkUserIsLoginController(),
                getPages: AppPages.pages,
                theme: controller.getTheme(),
              );
            });
      },
    );
  }
}
