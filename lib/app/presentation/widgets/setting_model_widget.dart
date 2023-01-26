import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/presentation/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SettingModelWidget extends StatelessWidget {
  const SettingModelWidget({
    required this.title,
    required this.icon,
    required this.color,
    required this.onClick,
    super.key,
  });
  final String title;
  final IconData icon;
  final Color color;
  final void Function()? onClick;
  static bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        horizontalTitleGap: 3,
        title: Text(
          title,
          style: TextStyle(
            fontSize: title.toLowerCase() == "logout" ? 18 : 16,
            fontFamily: appFont,
            color: title.toLowerCase() == "logout" ? Colors.red : null,
          ),
        ),
        leading: Container(
          height: 33,
          width: 33,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
          child: Icon(
            icon,
            size: 19,
            color: Colors.black54,
          ),
        ),
        trailing: title.toString().toLowerCase() == "dark mode"
            ? GetBuilder<ThemeController>(
                init: ThemeController.instance(),
                builder: (controller) {
                  return StatefulBuilder(builder: (context, setState) {
                    return Switch(
                      activeColor: Colors.blue,
                      inactiveTrackColor: Colors.grey,
                      value: ThemeStorage.instance().getKey(),
                      onChanged: (value) {
                        controller.setTheme();
                        setState(() {
                          isDarkMode = value;
                        });
                      },
                    );
                  });
                })
            : const Icon(
                Icons.arrow_forward_ios,
                size: 19,
                color: Colors.black54,
              ),
        onTap: onClick,
      ),
    );
  }
}
