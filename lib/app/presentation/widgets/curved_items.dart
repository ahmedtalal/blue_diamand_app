import 'package:flutter/material.dart';

Widget curvedItems({
  required String image,
}) {
  return Image(
    image: AssetImage(image),
    width: 20,
    height: 20,
  );
}
