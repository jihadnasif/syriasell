import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/Jobs/ViewJopApplicationControllrt.dart';
import '../../../core/class/StatusRequest.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/constant/AppimageAsset.dart';
import '../../../core/functions/timeAgo.dart';
import '../../../core/shared/ShareAndLinks.dart';
import '../../../data/model/job/ViewJobAppModel.dart';
import '../../widget/Job/CustomApplication.dart';

class JobApplicationDetails extends StatelessWidget {
  final int jobId;

  JobApplicationDetails({required this.jobId});

  @override
  Widget build(BuildContext context) {
    // استخدام الـ controller الموجود مسبقًا
    final controller = Get.find<ViewJopApplicationControllerImp>();

    // محاولة جلب البيانات من القائمة المحلية أولًا
    var job = controller.listJobApplication.firstWhereOrNull(
      (element) => element.jobId == jobId,
    );

    if (job != null) {
      // البيانات موجودة مسبقًا
      return _buildScaffold(controller, job);
    }

    // البيانات غير موجودة → جلب من السيرفر
    return FutureBuilder<ViewJobAppModel?>(
      future: controller.getJobApplicationById(jobId),
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
        return _buildScaffold(controller, job!);
      },
    );
  }

  // دالة تبني نفس التصميم كما كان
  Widget _buildScaffold(
      ViewJopApplicationControllerImp controller, ViewJobAppModel job) {
    return Scaffold(
      appBar: AppBar(
          title: Text(job.specialization ?? "186".tr),
          backgroundColor: Kcolor().kHeader,
          centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<ViewJopApplicationControllerImp>(
          builder: (controller) {
            if (controller.statusRequest == StatusRequest.loading) {
              return Center(
                child: Lottie.asset(ImageAsset.newLoding, fit: BoxFit.contain),
              );
            }
            return HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: CustomApplication(
                onpressIcon: () => controller.toggleFavorite(job.jobId),
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
                YearsExperience: job.yearsOfExperience.toString(),
                timeGo: job.createdAt != null
                    ? timeAgo(DateTime.parse(job.createdAt!))
                    : "",
                communication: (job.email == null || job.email!.isEmpty)
                    ? job.phoneNumber
                    : job.email,
                phone: job.phoneNumber,
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
                    routePath: "jobApp",
                    onShared: () => controller.incrementShareCount(job.jobId!),
                  );
                  if (shared) debugPrint("تمت المشاركة بنجاح!");
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
