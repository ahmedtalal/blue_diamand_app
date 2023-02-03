import 'package:drinking_app/app/presentation/controllers/theme_controller.dart';
import 'package:flutter/material.dart';

import '../../data/services/local/theme_local_Storage.dart';

Widget curvedItems({
  required String image,
}) {
  return Image(
    image: AssetImage(image),
    width: 20,
    height: 20,
    color: ThemeStorage.instance().getKey() ? Colors.white : Colors.black,
  );
}
