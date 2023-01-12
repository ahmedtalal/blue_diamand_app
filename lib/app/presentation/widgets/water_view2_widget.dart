import 'package:drinking_app/app/config/screen_handler.dart';
import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:flutter/material.dart';

class Waterview2Widget extends StatelessWidget {
  const Waterview2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: AppColor.color3,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage(
              waterImg,
            ),
            width: ScreenHandler.getScreenWidth(context) / 3,
            height: ScreenHandler.getScreenHeight(context) / 7,
            colorBlendMode: BlendMode.darken,
            color: AppColor.color3,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "5 Gallon Battle",
              style: TextStyle(
                fontSize: 16,
                fontFamily: appFont,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "20 ltr AED 5",
              style: TextStyle(
                fontSize: 13,
                fontFamily: appFont,
                color: Colors.black54,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "\$ 4.99",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: appFont,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                width: 70,
                height: 30,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  child: const Text(
                    "add",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: appFont,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
