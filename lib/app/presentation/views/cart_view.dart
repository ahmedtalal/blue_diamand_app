import 'package:drinking_app/app/config/screen_handler.dart';
import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/core/utils/widgets/header_shared_widget.dart';
import 'package:drinking_app/app/core/utils/widgets/text_bnt_shared_widget.dart';
import 'package:drinking_app/app/presentation/widgets/cart_view_widget.dart';
import 'package:drinking_app/app/presentation/widgets/nav_bar_widget.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static final GlobalKey<ScaffoldState> _sKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sKey,
      drawer: const NavBarWidget(),
      body: Container(
        height: ScreenHandler.getScreenHeight(context),
        width: ScreenHandler.getScreenWidth(context),
        margin: EdgeInsets.only(
          top: ScreenHandler.getScreenHeight(context) / 12,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeaderSharedWidget(
              onClick: () {
                _sKey.currentState!.openDrawer();
              },
            ),
            Expanded(
              flex: 9,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CartViewWidget();
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Total price ",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: appFont,
                          color: AppColor.color6,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$ 337.15",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: appFont,
                          color: AppColor.color6,
                        ),
                      ),
                    ],
                  ),
                  TextBtnSharedWidget(
                    btnTitle: "Check out",
                    btnHeight: 48,
                    btnWidth: ScreenHandler.getScreenWidth(context) / 2.9,
                    btnColor: AppColor.color5,
                    btnRaduis: 17,
                    onClick: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
