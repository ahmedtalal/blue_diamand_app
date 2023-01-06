import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:flutter/material.dart';

class AuthTextIconBtnWidget extends StatelessWidget {
  const AuthTextIconBtnWidget({
    required this.btnTitle,
    required this.btnHeight,
    required this.btnWidth,
    required this.btnColor,
    required this.btnRaduis,
    required this.onClick,
    required this.image,
    required this.fontSize,
    required this.imgSize,
    super.key,
  });
  final String btnTitle;
  final double btnRaduis, btnHeight, btnWidth;
  final Color btnColor;
  final void Function()? onClick;
  final String image;
  final double fontSize, imgSize;
  @override
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: btnHeight,
        width: btnWidth,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(left: 15, right: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(btnRaduis),
          color: btnColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(image),
              width: imgSize,
              height: imgSize,
            ),
            const SizedBox(width: 10),
            Text(
              btnTitle,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: appFont,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
