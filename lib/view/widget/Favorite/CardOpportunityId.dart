import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:syria_sell/LinkApp.dart';

import '../../../core/constant/AppColor.dart';
import '../../../core/functions/imageNetwork.dart';
import '../../../core/functions/linkWhatsApp.dart';
import '../Ads/TitleH2Ads.dart';
import '../ItemsDetails/ButtonDetails.dart';

class CardOpportunityid extends StatelessWidget {
  const CardOpportunityid({
    super.key,
    this.onClice,
    this.specialization,
    this.companyName,
    this.imagePath,
    this.city,
    this.description,
    this.timeGo,
    this.communication,
    this.phone,
    this.onpressIcon,
  });
  final void Function()? onClice;
  final String? specialization;
  final String? companyName;
  final String? imagePath;
  final String? city;
  final String? description;
  final String? timeGo;
  final String? communication;
  final String? phone;
  final void Function()? onpressIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onClice,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                    cachedNetworkImage(
                      width: 40,
                      height: 40,
                      imageUrl: "${LinkApp.JobOpportunities}$imagePath",
                      errorWidget: const Icon(Icons.broken_image, size: 40),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleH2Ads(
                            textTitleH2: companyName ?? "",
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
                  trimLines: 1,
                  colorClickableText: Kcolor().kTitleText,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '... قراءة المزيد',
                  trimExpandedText: ' إظهار أقل',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //  Text(timeGo ?? ""),
                    /*if (communication != null && communication!.isNotEmpty)
                      ButtonDetails(
                        text: communication!,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        colorButton: Kcolor().kButtonHome,
                        onTap: () {},
                      ),*/
                    ButtonDetails(
                      text: "108".tr,
                      colorButton: Kcolor().whatsapp,
                      onTap: () {
                        openWhatsApp(phone ?? "");
                      },
                    ),
                    /*
                    InkWell(
                      onTap: () {
                        openWhatsApp(phone ?? "");
                      },
                      child: Image.asset(
                        "${ImageAsset.KrootImageIcons}/whatsapp.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                    */
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
