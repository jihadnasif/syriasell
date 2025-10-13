import 'package:get/get.dart';
import 'package:syria_sell/core/constant/routes.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/functions/hindlingData.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/jobs/JobOpportunities.dart';
import '../../data/model/job/ViewJobOpportunitiesModel.dart';

class MyOppJobsControllerImp extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  List<ViewJobOpportunitiesModel> listJobOpportunities = [];
  JobOpportunitiesData jobOpportunitiesData = JobOpportunitiesData(Get.find());
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

  Future<void> refreshData() async {
    getMyJobOpportunityUser();
  }

  getMyJobOpportunityUser() async {
    listJobOpportunities.clear();
    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await jobOpportunitiesData.getUserId({
        "userid": myServices.sharedPreferences.getInt("idUser").toString(),
      });
      statusRequest = hindlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          List listData = response["data"];
          listJobOpportunities.addAll(
              listData.map((e) => ViewJobOpportunitiesModel.fromJson(e)));

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

  deleteJopOpp(Map dataap) async {
    listJobOpportunities.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await jobOpportunitiesData.deleteJobOpportunity(dataap);
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

  goToEditJobOpp() {}

  @override
  void onInit() async {
    super.onInit();
    await getMyJobOpportunityUser();
  }
}
