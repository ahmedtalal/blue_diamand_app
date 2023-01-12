import 'package:drinking_app/app/config/screen_handler.dart';
import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/core/utils/widgets/header_shared_widget.dart';
import 'package:drinking_app/app/presentation/widgets/coupon_view_widget.dart';
import 'package:drinking_app/app/presentation/widgets/nav_bar_widget.dart';
import 'package:drinking_app/app/presentation/widgets/text_form_field_widget.dart';
import 'package:drinking_app/app/presentation/widgets/water_view1_widget.dart';
import 'package:drinking_app/app/presentation/widgets/water_view2_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeaderSharedWidget(
                onClick: () {
                  _sKey.currentState!.openDrawer();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldSharedWidget(
                label: "search here",
                hint: "search here",
                textType: TextInputType.text,
                prefIcon: Icons.search,
                onChangeListenser: (String? newvalue) {},
                onValidateListenser: (String? value) {},
                initialValue: "",
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: ScreenHandler.getScreenHeight(context) / 4.4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Waterview1Widget();
                  },
                ),
              ),
              SizedBox(
                height: ScreenHandler.getScreenHeight(context) / 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Products",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: appFont,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Click see all & make order by your coupon",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: appFont,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: appFont,
                        color: AppColor.color1,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: ScreenHandler.getScreenHeight(context) / 3.7,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Waterview2Widget();
                  },
                ),
              ),
              SizedBox(
                height: ScreenHandler.getScreenHeight(context) / 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Coupons",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: appFont,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Click see all & choose more coupon",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: appFont,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: appFont,
                        color: AppColor.color1,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: ScreenHandler.getScreenHeight(context) / 6,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const CouponViewWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
