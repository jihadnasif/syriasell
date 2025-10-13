import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../core/constant/AppColor.dart';
import '../../../core/functions/linkWhatsApp.dart';
import '../Ads/TitleH2Ads.dart';
import '../ItemsDetails/ButtonDetails.dart';

class CardApplicationid extends StatelessWidget {
  final void Function()? onClice;
  final String? specialization;
  final String? fullName;
  final String? city;
  final String? description;
  final String? YearsExperience;
  final String? phone;

  const CardApplicationid({
    super.key,
    this.onClice,
    this.specialization,
    this.fullName,
    this.city,
    this.description,
    this.YearsExperience,
    this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClice,
      child: Container(
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
                          TitleH2Ads(textTitleH2: fullName ?? ""),
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
                  trimCollapsedText: '200'.tr,
                  trimExpandedText: '201'.tr,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                TitleH2Ads(
                  textTitleH2: "197".tr + ": ${YearsExperience ?? "-"}",
                ),
                const SizedBox(height: 20),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /*InkWell(
                      onTap: () {
                        openWhatsApp(phone ?? "");
                      },
                      child: Image.asset(
                        "${ImageAsset.KrootImageIcons}/whatsapp.png",
                        width: 30,
                        height: 30,
                      ),
                    ),*/
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
      ),
    );
  }
}
