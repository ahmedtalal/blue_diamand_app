import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:flutter/material.dart';

class ProdcutviewWidget extends StatelessWidget {
  const ProdcutviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColor.color3,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(
              waterImg,
            ),
            width: 100,
            height: 100,
            colorBlendMode: BlendMode.darken,
            color: AppColor.color3,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "5 Gallon Battle",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: appFont,
                        color: Colors.black87,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.favorite_border,
                        size: 20,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "20 ltr AED 5",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: appFont,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "\$ 4.99",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: appFont,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 30,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        child: const Text(
                          "add",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: appFont,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
