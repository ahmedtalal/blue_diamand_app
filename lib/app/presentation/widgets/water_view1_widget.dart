import 'package:drinking_app/app/config/screen_handler.dart';
import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:flutter/material.dart';

class Waterview1Widget extends StatelessWidget {
  const Waterview1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: AppColor.color1,
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          colorFilter: ColorFilter.mode(
            AppColor.color1,
            BlendMode.darken,
          ),
          alignment: Alignment.centerRight,
          image: AssetImage(
            waterImg,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "LOW \nSODIUM",
            style: TextStyle(
              fontSize: 20,
              fontFamily: appFont,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "20 ltr.Water battle",
            style: TextStyle(
              fontSize: 16,
              fontFamily: appFont,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: ScreenHandler.getScreenWidth(context) / 3.7,
            height: ScreenHandler.getScreenHeight(context) / 20,
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              child: const Text(
                "Shop Now",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: appFont,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
