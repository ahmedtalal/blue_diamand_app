import 'package:drinking_app/app/presentation/routes/app_pages.dart';
import 'package:drinking_app/app/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const DrinkApp());
}

class DrinkApp extends StatelessWidget {
  const DrinkApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreenViewRout,
      getPages: AppPages.pages,
    );
  }
}
