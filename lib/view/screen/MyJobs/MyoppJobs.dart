import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:syria_sell/core/constant/AppColor.dart';
import 'package:syria_sell/core/constant/variable.dart';
import 'package:syria_sell/view/widget/Ads/ButtonMyAds.dart';
import 'package:syria_sell/view/widget/Home/HeaderHomeTitle.dart';

import '../../../controller/MyJobs/MyOppJobsControllerImp.dart';
import '../../../core/class/StatusRequest.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/AppimageAsset.dart';
import '../../../core/functions/Dialog.dart';
import '../../../core/functions/DialogAdds.dart';
import '../../../core/functions/timeAgo.dart';
import '../../widget/Home/BottomTap.dart';
import '../../widget/Myjobs/CustomMyOpportunity.dart';

class MyOppjobs extends StatelessWidget {
  const MyOppjobs({super.key});
  @override
  Widget build(BuildContext context) {
    MyOppJobsControllerImp controller = Get.put(MyOppJobsControllerImp());
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
      bottomNavigationBar: BottomTap(
        coloIcone3: Kcolor().KlightBlueAccent,
      ),
      body: GetBuilder<MyOppJobsControllerImp>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return Center(
              child: Lottie.asset(ImageAsset.newLoding, fit: BoxFit.contain),
            );
          }

          return HandlingDataView(
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
                    textTile: "191".tr,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.grey.shade200,
                    height: sizeHeight(context) * 0.1,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ButtonMyAds(
                            onTap: () {
                              controller.goToPublishedAds();
                            },
                            colorButton: Kcolor().kButtonHome,
                            text: "76".tr,
                          ),
                          ButtonMyAds(
                            onTap: () {
                              controller.goToReviewAds();
                            },
                            colorButton: Kcolor().kButtonHome,
                            text: "77".tr,
                          ),
                          ButtonMyAds(
                            onTap: () {
                              controller.goToMyOppJobs();
                            },
                            colorButton: Kcolor().kPrimaryColor,
                            text: "191".tr,
                          ),
                          ButtonMyAds(
                            onTap: () {
                              controller.goToMyAppJobs();
                            },
                            colorButton: Kcolor().kButtonHome,
                            text: "192".tr,
                          ),
                        ],
                      ),
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
                            controller.listJobOpportunities.length,
                            (index) {
                              var job = controller.listJobOpportunities[index];
                              return CustomMyOpportunity(
                                onpressDelete: () {
                                  showInfoDialog(
                                    "153".tr,
                                    "165".tr,
                                    dialogType: DialogType.warning,
                                    okButtonText: "11".tr,
                                    onOkPress: () {
                                      controller.deleteJopOpp({
                                        "image": controller
                                            .listJobOpportunities[index].image,
                                        "jobs_opportunity_id": controller
                                            .listJobOpportunities[index].jobId
                                            .toString(),
                                      });
                                    },
                                    cancelButtonText: "162".tr,
                                    onCancelPress: () {},
                                  );
                                },
                                specialization: job.specialization,
                                imagePath: job.image,
                                companyName: job.companyName,
                                city: job.cityAr,
                                description: job.description,
                                timeGo: job.createdAt != null
                                    ? timeAgo(DateTime.parse(job.createdAt!))
                                    : "",
                                communication: job.email ?? "",
                                phone: job.phone,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  //------contact-----

                  //--------end contact-----

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
