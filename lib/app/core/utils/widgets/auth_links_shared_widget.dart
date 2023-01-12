import 'dart:ffi';

import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:flutter/material.dart';

class AuthLinksSharedWidget extends StatelessWidget {
  const AuthLinksSharedWidget({
    required this.onClick,
    required this.text,
    required this.textLink,
    super.key,
  });
  final String text, textLink;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: appFont,
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: onClick,
            child: Text(
              textLink,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: appFont,
                color: AppColor.color1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
