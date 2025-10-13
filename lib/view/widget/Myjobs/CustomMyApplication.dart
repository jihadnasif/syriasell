import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../core/constant/AppColor.dart';
import '../../../core/functions/linkWhatsApp.dart';
import '../Ads/TitleH2Ads.dart';
import '../ItemsDetails/ButtonDetails.dart';

class CustomMyApplication extends StatelessWidget {
  CustomMyApplication({
    super.key,
    this.specialization,
    this.fullName,
    this.city,
    this.description,
    this.YearsExperience,
    this.timeGo,
    this.communication,
    this.phone,
    this.onpressDelete,
  });

  final String? specialization;
  final String? fullName;
  final String? city;
  final String? description;
  final String? YearsExperience;
  final String? timeGo;
  final String? communication;
  final String? phone;
  void Function()? onpressDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TitleH2Ads(
                      textTitleH2: specialization ?? "",
                      sizeFont: 22,
                      colorFont: Kcolor().kTitleText,
                    ),
                  ),
                  IconButton(
                    onPressed: onpressDelete,
                    icon: Icon(
                      Icons.delete,
                      color: Kcolor().kred,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleH2Ads(
                          textTitleH2: fullName ?? "",
                        ),
                        Text(
                          city ?? "",
                          style: const TextStyle(color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ReadMoreText(
                description ?? "",
                trimLines: 5,
                colorClickableText: Kcolor().kTitleText,
                trimMode: TrimMode.Line,
                trimCollapsedText: '... قراءة المزيد',
                trimExpandedText: ' إظهار أقل',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              TitleH2Ads(
                textTitleH2: "197".tr + ": ${YearsExperience}",
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(timeGo ?? ""),
                  if (communication != null && communication!.isNotEmpty)
                    ButtonDetails(
                      text: communication!,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      colorButton: Kcolor().kButtonHome,
                      onTap: () {},
                    ),
                  ButtonDetails(
                    text: "108".tr,
                    colorButton: Kcolor().whatsapp,
                    onTap: () {
                      openWhatsApp(phone ?? "");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
