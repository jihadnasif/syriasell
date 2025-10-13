import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../core/constant/AppColor.dart';
import '../../../core/functions/linkWhatsApp.dart';
import '../Ads/TitleH2Ads.dart';
import '../Comments/CommentsSectionJobApp.dart';
import '../ItemsDetails/ButtonDetails.dart';

class CustomApplication extends StatelessWidget {
  final String? specialization;
  final String? fullName;
  final String? city;
  final String? description;
  final String? YearsExperience;
  final String? timeGo;
  final String? communication;
  final String? phone;
  final Widget? iconData;
  final void Function()? onpressIcon;
  final IconData? iconDataLike;
  final void Function()? onpressIconLike;
  final String? textLikeCount;
  final String? textCommentCount;
  final int jobId;
  final void Function()? onpressShare;
  final String? textShareCount;

  const CustomApplication({
    super.key,
    this.specialization,
    this.fullName,
    this.city,
    this.description,
    this.YearsExperience,
    this.timeGo,
    this.communication,
    this.phone,
    this.iconData,
    this.onpressIcon,
    this.iconDataLike,
    this.onpressIconLike,
    this.textLikeCount,
    this.textCommentCount,
    required this.jobId,
    this.onpressShare,
    this.textShareCount,
  });

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
                    onPressed: onpressIcon,
                    icon: iconData ?? const Icon(Icons.more_vert),
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
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            iconDataLike ?? Icons.thumb_up_off_alt,
                            color: Colors.blue,
                          ),
                          onPressed: onpressIconLike,
                        ),
                        Text(textLikeCount ?? "0"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chat, color: Colors.green),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (_) => FractionallySizedBox(
                                heightFactor: 0.8,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
                                  ),
                                  child: CommentsSectionJobApp(jobId: jobId),
                                ),
                              ),
                            );
                          },
                        ),
                        Text(textCommentCount ?? "0"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.share, color: Colors.orange),
                          onPressed: onpressShare,
                        ),
                        // Text(textShareCount ?? "0"),
                      ],
                    ),
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
