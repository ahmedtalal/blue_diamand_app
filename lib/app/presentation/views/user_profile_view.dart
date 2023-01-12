import 'package:drinking_app/app/config/screen_handler.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: ScreenHandler.getScreenHeight(context),
      width: ScreenHandler.getScreenWidth(context),
      padding: const EdgeInsets.all(12),
      margin: EdgeInsets.only(top: ScreenHandler.getScreenHeight(context) / 13),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                const Text(
                  "User Profile",
                  style: TextStyle(fontSize: 18, fontFamily: appFont),
                ),
              ],
            ),
            SizedBox(
              height: ScreenHandler.getScreenHeight(context) / 12,
            ),
            Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[200],
                    child: const ClipOval(
                      child: Image(
                        image: AssetImage(
                          userImg,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: const Image(
                      image: AssetImage(
                        cameraBtn,
                      ),
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
