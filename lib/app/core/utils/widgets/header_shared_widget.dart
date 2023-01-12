import 'package:drinking_app/app/config/screen_handler.dart';
import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:flutter/material.dart';

class HeaderSharedWidget extends StatelessWidget {
  const HeaderSharedWidget({
    required this.onClick,
    Key? key,
  }) : super(key: key);
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: onClick,
              child: const Icon(
                Icons.sort,
                color: Colors.black,
                size: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "BLUE DIAMAND",
              style: TextStyle(
                fontSize: 16,
                fontFamily: appFont,
                color: AppColor.color1,
              ),
            )
          ],
        ),
        Row(
          children: [
            Image(
              image: const AssetImage(
                locationImg,
              ),
              height: ScreenHandler.getScreenHeight(context) / 40,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Dubia",
              style: TextStyle(
                fontSize: 16,
                fontFamily: appFont,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Image(
              image: const AssetImage(userImg),
              height: ScreenHandler.getScreenHeight(context) / 22,
            ),
          ],
        ),
      ],
    );
  }
}
