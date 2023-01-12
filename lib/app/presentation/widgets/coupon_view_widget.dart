import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:flutter/material.dart';

class CouponViewWidget extends StatelessWidget {
  const CouponViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
        left: 5,
        right: 5,
        top: 5,
      ),
      decoration: BoxDecoration(
        color: AppColor.color3,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "5 Days",
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: appFont,
                  color: AppColor.color1,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Gold Mid",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: appFont,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "AED 1200",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: appFont,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 90,
                height: 37,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColor.color1,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: const BorderSide(
                          color: AppColor.color1,
                        ),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Read More",
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
          )
        ],
      ),
    );
  }
}
