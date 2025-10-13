import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/constant/variable.dart';
import 'package:syria_sell/view/widget/Ads/ButtonMyAds.dart';
import 'package:syria_sell/view/widget/Home/HeaderHomeTitle.dart';

import '../../../controller/Jobs/ViewJopApplicationControllrt.dart';
import '../../../core/class/StatusRequest.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/AppimageAsset.dart';
import '../../../core/functions/DialogAdds.dart';
import '../../../core/functions/timeAgo.dart';
import '../../../core/shared/ShareAndLinks.dart';
import '../../widget/Home/BottomTap.dart';
import '../../widget/Job/CustomApplication.dart';

class ViewJopApplication extends StatelessWidget {
  const ViewJopApplication({super.key});
  @override
  Widget build(BuildContext context) {
    ViewJopApplicationControllerImp controller =
        Get.put(ViewJopApplicationControllerImp());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showInfoDialogAdds();
        },
        shape: CircleBorder(),
        backgroundColor: Kcolor().kwhite,
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomTap(),
      body: GetBuilder<ViewJopApplicationControllerImp>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return Center(
              child: Lottie.asset(ImageAsset.newLoding, fit: BoxFit.contain),
            );
          }
          return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: RefreshIndicator(
              onRefresh: () async {
                await controller
                    .refreshData(); // تابع جديد في الكونترولر لتحديث البيانات
              },
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  HeaderHomeTitle(
                    textTile: "192".tr,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.grey.shade200,
                    height: sizeHeight(context) * 0.1,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        ButtonMyAds(
                          onTap: () {
                            controller.goToViewJopApplication();
                          },
                          colorButton: Kcolor().kPrimaryColor,
                          text: "192".tr,
                        ),
                        ButtonMyAds(
                          onTap: () {
                            controller.goToViewJopOpportunity();
                          },
                          colorButton: Kcolor().kButtonHome,
                          text: "191".tr,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 800),
                      child: Column(
                        children: [
                          ...List.generate(
                            controller.listJobApplication.length,
                            (index) {
                              var job = controller.listJobApplication[index];
                              return GestureDetector(
                                onTap: () {
                                  controller.goToJobApplicationId(job.jobId!);
                                },
                                child: CustomApplication(
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
                                  fullName: job.fullName,
                                  city: job.cityAr,
                                  description: job.description,
                                  YearsExperience:
                                      job.yearsOfExperience.toString(),
                                  timeGo: job.createdAt != null
                                      ? timeAgo(DateTime.parse(job.createdAt!))
                                      : "",
                                  communication:
                                      (job.email == null || job.email!.isEmpty)
                                          ? job.phoneNumber
                                          : job.email,
                                  phone: job.phoneNumber,
                                  iconDataLike:
                                      controller.isLiked[job.jobId] == true
                                          ? Icons.thumb_up
                                          : Icons.thumb_up_off_alt,
                                  onpressIconLike: () =>
                                      controller.toggleLike(job.jobId!),
                                  textLikeCount:
                                      "${controller.likesCount[job.jobId] ?? 0}",
                                  textCommentCount:
                                      "${controller.commentsCount[job.jobId] ?? 0}",
                                  onpressShare: () async {
                                    bool shared = await ShareAndLinks.shareAd(
                                      adId: job.jobId.toString(),
                                      adTitle: job.specialization ?? "",
                                      //context: context,
                                      routePath: "jobApp",
                                      onShared: () {
                                        controller
                                            .incrementShareCount(job.jobId!);
                                      },
                                    );
                                    if (shared) print("تمت المشاركة بنجاح!");
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
                  // ----Column or AdStatus----

                  // ---- End AdStatus-------

                  SizedBox(
                    height: sizeHeight(context) * 0.1,
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
