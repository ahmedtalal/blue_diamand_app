import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:flutter/material.dart';

class TextIconBtnSharedWidget extends StatelessWidget {
  const TextIconBtnSharedWidget({
    required this.btnTitle,
    required this.btnHeight,
    required this.btnWidth,
    required this.btnColor,
    required this.btnRaduis,
    required this.onClick,
    required this.icon,
    required this.iconColor,
    super.key,
  });
  final String btnTitle;
  final double btnRaduis, btnHeight, btnWidth;
  final Color btnColor, iconColor;
  final void Function()? onClick;
  final IconData icon;
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
        child: btnTitle.toLowerCase() == "back"
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 20,
                    color: iconColor,
                  ),
                  Text(
                    btnTitle,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: appFont,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    btnTitle,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: appFont,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    icon,
                    size: 25,
                    color: iconColor,
                  ),
                ],
              ),
      ),
    );
  }
}
