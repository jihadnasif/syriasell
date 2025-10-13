import 'package:get/get.dart';
import 'package:syria_sell/core/constant/routes.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/functions/hindlingData.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/jobs/JobApplicationData.dart';
import '../../data/model/job/ViewJobAppModel.dart';

class MyApplicationJobsControllerImp extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  List<ViewJobAppModel> listJobApplication = [];
  JobApplicationsData jobApplicationData = JobApplicationsData(Get.find());
  MyServices myServices = Get.find();

  goToReviewAds() {
    Get.toNamed(AppRoute.rReviewAds);
  }

  goToPublishedAds() {
    Get.toNamed(AppRoute.rPublishedAds);
  }

  goToMyOppJobs() {
    Get.toNamed(AppRoute.rMyOppjobs);
  }

  goToMyAppJobs() {
    Get.toNamed(AppRoute.rMyApplicationjobs);
  }

  refreshData() {
    getMyJobApplicationUser();
  }

  getMyJobApplicationUser() async {
    listJobApplication.clear();
    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await jobApplicationData.getUserId({
        "userid": myServices.sharedPreferences.getInt("idUser").toString(),
      });
      statusRequest = hindlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          List listData = response["data"];
          listJobApplication
              .addAll(listData.map((e) => ViewJobAppModel.fromJson(e)));

          statusRequest = StatusRequest.success;
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    } catch (e) {
      print("Error fetching jobs: $e");
      statusRequest = StatusRequest.serverfException;
    }
    update();
  }

  deleteJopApp(Map dataap) async {
    listJobApplication.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await jobApplicationData.deleteApplication(dataap);
    statusRequest = hindlingData(response);
    print("------after data------------${response}");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        refreshData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToEditJobApp() {}

  @override
  void onInit() async {
    super.onInit();
    await getMyJobApplicationUser();
  }
}
