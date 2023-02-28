import 'package:drinking_app/app/config/screen_handler.dart';
import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/presentation/controllers/internet_controller.dart';
import 'package:drinking_app/app/presentation/views/register_view.dart';
import 'package:drinking_app/app/core/utils/widgets/text_bnt_shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenview extends StatefulWidget {
  const SplashScreenview({super.key});

  @override
  State<SplashScreenview> createState() => _SplashScreenviewState();
}

class _SplashScreenviewState extends State<SplashScreenview> {
  @override
  void initState() {
    InternetController.instance().checkInternetCon();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ScreenHandler.getScreenHeight(context) / 10),
              const Expanded(
                flex: 4,
                child: SizedBox(
                  child: Image(
                    image: AssetImage(
                      drinkImg,
                    ),
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: ScreenHandler.getScreenHeight(context) / 20),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        "BLUE DIAMOND",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: appFont,
                          color: AppColor.color1,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: ScreenHandler.getScreenHeight(context) / 12),
                    Container(
                      margin: EdgeInsets.only(
                        left: ScreenHandler.getScreenWidth(context) / 8,
                      ),
                      child: const Text(
                        description,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: appFont,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: ScreenHandler.getScreenHeight(context) / 10),
              TextBtnSharedWidget(
                btnTitle: "Get started",
                btnHeight: ScreenHandler.getScreenHeight(context) / 13,
                btnWidth: double.maxFinite,
                btnColor: AppColor.color1,
                btnRaduis: 12,
                onClick: () {
                  Get.offAll(
                    () => const RegisterView(),
                  );
                },
              ),
              SizedBox(height: ScreenHandler.getScreenHeight(context) / 8),
            ],
          )),
    );
  }
}
