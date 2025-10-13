import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/functions/timeAgo.dart';
import 'package:syria_sell/core/shared/ShareAndLinks.dart';

import '../../../controller/Jobs/ViewJopOpportunityController.dart';
import '../../../core/class/StatusRequest.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/AppimageAsset.dart';
import '../../../data/model/job/ViewJobOpportunitiesModel.dart';
import '../../widget/Job/CustomOpportunity.dart';

class JobOpportunityDetails extends StatelessWidget {
  final int jobId;
  JobOpportunityDetails({required this.jobId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ViewJopOpportunityControllerImp>();

    // ✅ جرّب من القائمة أولاً
    var job = controller.listJobOpportunities.firstWhereOrNull(
      (element) => element.jobId == jobId,
    );

    if (job != null) {
      return _buildScaffold(controller, job);
    }

    // ❌ ما في بيانات → جيب من السيرفر
    return FutureBuilder<ViewJobOpportunitiesModel?>(
      future: controller.getJobOpportunityById(jobId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
                title: Text("207".tr),
                backgroundColor: Kcolor().kHeader,
                centerTitle: true),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
                title: Text("206".tr),
                backgroundColor: Kcolor().kHeader,
                centerTitle: true),
            body: Center(child: Text("205".tr)),
          );
        }

        job = snapshot.data!;
        return _buildScaffold(controller, snapshot.data!);
      },
    );
  }

  // 🔹 تصميمك نفسه بدون أي تعديل
  Widget _buildScaffold(ViewJopOpportunityControllerImp controller,
      ViewJobOpportunitiesModel job) {
    return Scaffold(
      appBar: AppBar(
          title: Text(job.specialization ?? "186".tr),
          backgroundColor: Kcolor().kHeader,
          centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<ViewJopOpportunityControllerImp>(
          builder: (controller) {
            if (controller.statusRequest == StatusRequest.loading) {
              return Center(
                child: Lottie.asset(ImageAsset.newLoding, fit: BoxFit.contain),
              );
            }

            return HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: CustomOpportunity(
                onpressIcon: () => controller.toggleFavorite(job.jobId),
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
                    ? timeAgo(DateTime.parse(job.createdAt!))
                    : "",
                communication: (job.email == null || job.email!.isEmpty)
                    ? job.phone
                    : job.email,
                phone: job.phone,
                iconDataLike: controller.isLiked[job.jobId] == true
                    ? Icons.thumb_up
                    : Icons.thumb_up_off_alt,
                onpressIconLike: () => controller.toggleLike(job.jobId!),
                textLikeCount: "${controller.likesCount[job.jobId] ?? 0}",
                textCommentCount: "${controller.commentsCount[job.jobId] ?? 0}",
                onpressShare: () async {
                  bool shared = await ShareAndLinks.shareAd(
                    adId: job.jobId.toString(),
                    adTitle: job.specialization ?? "",
                    routePath: "jobOpp",
                    onShared: () => controller.incrementShareCount(job.jobId!),
                  );
                  if (shared) print("تمت المشاركة بنجاح!");
                },
                jobId: job.jobId!,
              ),
            );
          },
        ),
      ),
    );
  }
}
