import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/presentation/controllers/auth_controller.dart';
import 'package:drinking_app/app/presentation/controllers/user_controller.dart';
import 'package:drinking_app/app/presentation/views/setting_view.dart';
import 'package:drinking_app/app/presentation/views/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  @override
  void initState() {
    UserController.instance().getUserInfoCon();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          GetX<UserController>(
              init: UserController.instance(),
              initState: (state) {
                state.controller!.getUserInfoCon();
              },
              builder: (controller) {
                if (controller.isLoading.value == false) {
                  return const UserAccountsDrawerHeader(
                    accountName: Text(
                      "example",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: appFont,
                      ),
                    ),
                    accountEmail: Text(
                      "example@gmail.com",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: appFont,
                      ),
                    ),
                    currentAccountPicture: CircleAvatar(
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(userImg),
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage(
                          profleImg,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }
                return UserAccountsDrawerHeader(
                  accountName: Text(
                    controller.userInfoModel.value.user!.fullName!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: appFont,
                    ),
                  ),
                  accountEmail: Text(
                    controller.userInfoModel.value.user!.email!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: appFont,
                    ),
                  ),
                  currentAccountPicture: const CircleAvatar(
                    child: ClipOval(
                      child: Image(
                        image: AssetImage(userImg),
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      image: AssetImage(
                        profleImg,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
          const SizedBox(
            height: 12,
          ),
          ListTile(
            horizontalTitleGap: -10,
            title: const Text(
              "Coupon List",
              style: TextStyle(
                fontSize: 16,
                fontFamily: appFont,
              ),
            ),
            leading: const Icon(
              Icons.list_alt,
              size: 19,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 19,
            ),
            onTap: () {},
          ),
          ListTile(
            horizontalTitleGap: -10,
            title: const Text(
              "Products",
              style: TextStyle(
                fontSize: 16,
                fontFamily: appFont,
              ),
            ),
            leading: const Icon(
              Icons.fact_check,
              size: 19,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 19,
            ),
            onTap: () {},
          ),
          ListTile(
            horizontalTitleGap: -10,
            title: const Text(
              "My Orders",
              style: TextStyle(
                fontSize: 16,
                fontFamily: appFont,
              ),
            ),
            leading: const Icon(
              Icons.dvr,
              size: 19,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 19,
            ),
            onTap: () {},
          ),
          ListTile(
            horizontalTitleGap: -10,
            title: const Text(
              "My Coupons",
              style: TextStyle(
                fontSize: 16,
                fontFamily: appFont,
              ),
            ),
            leading: const Icon(
              Icons.format_list_bulleted_outlined,
              size: 19,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 19,
            ),
            onTap: () {},
          ),
          ListTile(
            horizontalTitleGap: -10,
            title: const Text(
              "My Account",
              style: TextStyle(
                fontSize: 16,
                fontFamily: appFont,
              ),
            ),
            leading: const Icon(
              Icons.assignment_ind,
              size: 19,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 19,
            ),
            onTap: () {
              Get.to(() => const UserProfileView());
            },
          ),
          ListTile(
            horizontalTitleGap: -10,
            title: const Text(
              "My WishList",
              style: TextStyle(
                fontSize: 16,
                fontFamily: appFont,
              ),
            ),
            leading: const Icon(
              Icons.favorite_border,
              size: 19,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 19,
            ),
            onTap: () {},
          ),
          ListTile(
            horizontalTitleGap: -10,
            title: const Text(
              "Settings",
              style: TextStyle(
                fontSize: 16,
                fontFamily: appFont,
              ),
            ),
            leading: const Icon(
              Icons.settings,
              size: 19,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 19,
            ),
            onTap: () {
              Get.to(() => const SettingsView());
            },
          ),
          ListTile(
            horizontalTitleGap: -10,
            title: const Text(
              "Share App",
              style: TextStyle(
                fontSize: 16,
                fontFamily: appFont,
              ),
            ),
            leading: const Icon(
              Icons.share_outlined,
              size: 19,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 19,
            ),
            onTap: () {},
          ),
          ListTile(
            horizontalTitleGap: -10,
            title: const Text(
              "Rate App",
              style: TextStyle(
                fontSize: 16,
                fontFamily: appFont,
              ),
            ),
            leading: const Icon(
              Icons.rate_review,
              size: 19,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 19,
            ),
            onTap: () {},
          ),
          GetBuilder<AuthController>(
              init: AuthController.instance,
              builder: (controller) {
                return ListTile(
                  horizontalTitleGap: -10,
                  title: const Text(
                    "LogOut",
                    style: TextStyle(
                      fontSize: 19,
                      fontFamily: appFont,
                      color: AppColor.color1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: const Icon(
                    Icons.logout,
                    size: 19,
                    color: AppColor.color1,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 19,
                    color: AppColor.color1,
                  ),
                  onTap: () {
                    controller.logOutCon();
                  },
                );
              }),
        ],
      ),
    );
  }
}
