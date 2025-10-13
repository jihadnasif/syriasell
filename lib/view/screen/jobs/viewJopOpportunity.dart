import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/constant/variable.dart';
import 'package:syria_sell/view/widget/Ads/ButtonMyAds.dart';
import 'package:syria_sell/view/widget/Home/HeaderHomeTitle.dart';

import '../../../controller/Jobs/ViewJopOpportunityController.dart';
import '../../../core/class/StatusRequest.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/AppimageAsset.dart';
import '../../../core/functions/DialogAdds.dart';
import '../../../core/functions/timeAgo.dart';
import '../../../core/shared/ShareAndLinks.dart';
import '../../widget/Home/BottomTap.dart';
import '../../widget/Job/CustomOpportunity.dart';

class ViewJopOpportunity extends StatelessWidget {
  const ViewJopOpportunity({super.key});

  @override
  Widget build(BuildContext context) {
    ViewJopOpportunityControllerImp controller =
        Get.put(ViewJopOpportunityControllerImp());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showInfoDialogAdds();
        },
        shape: const CircleBorder(),
        backgroundColor: Kcolor().kwhite,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomTap(),
      body: GetBuilder<ViewJopOpportunityControllerImp>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return Center(
              child: Lottie.asset(ImageAsset.newLoding, fit: BoxFit.contain),
            );
          }

          return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: RefreshIndicator(
              onRefresh: controller.refreshData,
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  HeaderHomeTitle(textTile: "191".tr),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Container(
                          color: Colors.grey.shade200,
                          height: sizeHeight(context) * 0.1,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              ButtonMyAds(
                                onTap: controller.goToViewJopApplication,
                                colorButton: Kcolor().kButtonHome,
                                text: "192".tr,
                              ),
                              ButtonMyAds(
                                onTap: controller.goToViewJopOpportunity,
                                colorButton: Kcolor().kPrimaryColor,
                                text: "191".tr,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 800),
                            child: Column(
                              children: [
                                ...List.generate(
                                  controller.listJobOpportunities.length,
                                  (index) {
                                    var job =
                                        controller.listJobOpportunities[index];
                                    return GestureDetector(
                                      onTap: () {
                                        controller
                                            .goToJobOpportunityId(job.jobId!);
                                      },
                                      child: CustomOpportunity(
                                        onpressIcon: () {
                                          controller.toggleFavorite(job.jobId);
                                        },
                                        iconData: Icon(
                                          controller.isFavorites[job.jobId] == 1
                                              ? Icons.favorite
                                              : Icons.favorite_border_outlined,
                                          color: Kcolor().KdeepOrange,
                                        ),
                                        specialization: job.specialization,
                                        imagePath: job.image,
                                        companyName: job.companyName,
                                        city: job.cityAr,
                                        description: job.description,
                                        timeGo: job.createdAt != null
                                            ? timeAgo(
                                                DateTime.parse(job.createdAt!))
                                            : "",
                                        communication: (job.email == null ||
                                                job.email!.isEmpty)
                                            ? job.phone
                                            : job.email,
                                        phone: job.phone,
                                        iconDataLike:
                                            controller.isLiked[job.jobId] ==
                                                    true
                                                ? Icons.thumb_up
                                                : Icons.thumb_up_off_alt,
                                        onpressIconLike: () =>
                                            controller.toggleLike(job.jobId!),
                                        textLikeCount:
                                            "${controller.likesCount[job.jobId] ?? 0}",
                                        textCommentCount:
                                            "${controller.commentsCount[job.jobId] ?? 0}",
                                        onpressShare: () async {
                                          bool shared =
                                              await ShareAndLinks.shareAd(
                                            adId: job.jobId.toString(),
                                            adTitle: job.specialization ?? "",
                                            //context: context,
                                            routePath: "jobOpp",
                                            onShared: () {
                                              controller.incrementShareCount(
                                                  job.jobId!);
                                            },
                                          );
                                          if (shared)
                                            print("تمت المشاركة بنجاح!");
                                        },
                                        jobId: job.jobId!,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
