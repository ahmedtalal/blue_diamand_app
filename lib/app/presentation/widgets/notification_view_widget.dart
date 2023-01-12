import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:flutter/material.dart';

class NotificationViewWidget extends StatelessWidget {
  const NotificationViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColor.color4,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: AppColor.color1,
            child: ClipOval(
              child: Image(
                image: AssetImage(notiBackground),
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "E-commerce",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: appFont,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "thanks for downloading our e-commerce app",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: appFont,
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "two hours ago",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: appFont,
                        color: Colors.grey[700],
                      ),
                    ),
                    Icon(
                      Icons.close,
                      size: 17,
                      color: Colors.green[700],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
