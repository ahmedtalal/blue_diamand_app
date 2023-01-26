import 'package:drinking_app/app/config/screen_handler.dart';
import 'package:drinking_app/app/core/utils/widgets/header_shared_widget.dart';
import 'package:drinking_app/app/presentation/widgets/nav_bar_widget.dart';
import 'package:drinking_app/app/presentation/widgets/notification_view_widget.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
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
          top: ScreenHandler.getScreenHeight(context) / 20,
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
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const NotificationViewWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
