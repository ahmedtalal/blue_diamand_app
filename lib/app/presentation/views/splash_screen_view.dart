import 'package:drinking_app/app/config/screen_handler.dart';
import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/core/utils/testing_keys.dart';
import 'package:drinking_app/app/presentation/controllers/internet_controller.dart';
import 'package:drinking_app/app/presentation/views/register_view.dart';
import 'package:drinking_app/app/core/utils/widgets/text_bnt_shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    InternetController.instance().checkInternetCon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            height: ScreenHandler.getScreenHeight(context),
            width: ScreenHandler.getScreenWidth(context),
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
                      key: ValueKey(TestingKeys.SPLASH_IMAGE_KEY),
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
                      Center(
                        child: Text(
                          key: const ValueKey(TestingKeys.SPLASH_TITLE_KEY),
                          AppLocalizations.of(context)!.blueDiamond,
                          style: const TextStyle(
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
                        width: ScreenHandler.getScreenWidth(context),
                        margin: const EdgeInsets.all(5),
                        child: Text(
                          key: const ValueKey(
                              TestingKeys.SPLASH_DESCRIPTION_KEY),
                          AppLocalizations.of(context)!.blueDiamondDescription,
                          style: const TextStyle(
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
                  key: const ValueKey(TestingKeys.SPLASH_GET_STARTED_BTN_KEY),
                  btnTitle: AppLocalizations.of(context)!.getStarted,
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
      ),
    );
  }
}
