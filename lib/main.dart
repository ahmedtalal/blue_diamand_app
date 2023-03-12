import 'package:drinking_app/app/presentation/controllers/auth_controller.dart';
import 'package:drinking_app/app/presentation/controllers/theme_controller.dart';
import 'package:drinking_app/app/presentation/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  await GetStorage.init();
  runApp(const DrinkApp());
}

class DrinkApp extends StatefulWidget {
  const DrinkApp({Key? key}) : super(key: key);

  @override
  State<DrinkApp> createState() => _DrinkAppState();
  static void setAppLocale(BuildContext context, Locale locale) {
    _DrinkAppState? state = context.findAncestorStateOfType<_DrinkAppState>();
    state?.setLocale(locale);
  }
}

class _DrinkAppState extends State<DrinkApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

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
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: _locale,
              );
            });
      },
    );
  }
}
