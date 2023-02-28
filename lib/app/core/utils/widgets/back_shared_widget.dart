import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class BackSharedWidget extends StatelessWidget {
  const BackSharedWidget({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontFamily: appFont),
        ),
      ],
    );
  }
}
