import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:flutter/material.dart';

class TextBtnSharedWidget extends StatelessWidget {
  const TextBtnSharedWidget({
    required this.btnTitle,
    required this.btnHeight,
    required this.btnWidth,
    required this.btnColor,
    required this.btnRaduis,
    required this.onClick,
    super.key,
  });
  final String btnTitle;
  final double btnRaduis, btnHeight, btnWidth;
  final Color btnColor;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: btnHeight,
        width: btnWidth,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(left: 8, right: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(btnRaduis),
          color: btnColor,
        ),
        child: Text(
          btnTitle,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: appFont,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
