import 'package:flutter/material.dart';
import 'package:syria_sell/LinkApp.dart';

import '../../../core/constant/AppColor.dart';
import '../../../core/functions/imageNetwork.dart';

class CardItemsCategoryId extends StatelessWidget {
  final String urlImage;
  final String title;
  final String timAgo;
  final String pric;
  final String currency;

  final void Function() onclice;
  const CardItemsCategoryId({
    super.key,
    required this.urlImage,
    required this.title,
    required this.onclice,
    required this.timAgo,
    required this.pric,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onclice,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Kcolor().shadow,
                offset: const Offset(-5, 5), // يسار وأسفل فقط
                blurRadius: 6,
                spreadRadius: 0.5,
              ),
            ],
          ),
          child: Card(
            child: ListView(
              shrinkWrap: true,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 👇 الصورة تبقى بالوسط
                cachedNetworkImage(
                  imageUrl: "${LinkApp.uploadItems}$urlImage",
                  width: 100,
                  height: 100,
                  errorWidget: Icon(Icons.broken_image, size: 40),
                ),

                // 👇 النصوص كلها على اليمين
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // مهم ليصطف النص يمين
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Kcolor().kClosed,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              timAgo,
                              style: TextStyle(
                                color: Kcolor().kClosed,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              currency,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              pric,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
