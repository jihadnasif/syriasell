import 'package:get/get.dart';
import 'package:syria_sell/core/class/StatusRequest.dart';
import 'package:syria_sell/core/constant/routes.dart';
import 'package:syria_sell/core/functions/hindlingData.dart';
import 'package:syria_sell/core/services/services.dart';
import 'package:syria_sell/data/datasource/remote/jobs/FavoriteAllAppData.dart';
import 'package:syria_sell/data/datasource/remote/jobs/JobApplicationData.dart';
import 'package:syria_sell/data/model/job/ViewJobAppModel.dart';

import '../../core/functions/Dialog.dart';
import '../../data/datasource/remote/Items/itemData.dart';
import '../../data/model/CommentModel.dart';

class ViewJopApplicationControllerImp extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  List<ViewJobAppModel> listJobApplication = [];
  JobApplicationsData jobApplicationData = JobApplicationsData(Get.find());
  MyServices myServices = Get.find();
  Map<int, int> isFavorites = {}; // jobId -> 0/1
  FavoriteAllJobAppData viewFavoriteJobAppData =
      FavoriteAllJobAppData(Get.find());
  List<ViewJobAppModel> dataFavoriteJob = [];
  ViewJobAppModel? viewJobAppModel;

  goToViewJopOpportunity() {
    Get.toNamed(AppRoute.rViewJopOpportunity);
  }

  goToViewJopApplication() {
    Get.toNamed(AppRoute.rViewJopApplication);
  }

  goToJobApplicationId(int jobId) async {
    await Get.toNamed(
      AppRoute.rJobApplicationDetails,
      arguments: {"jobId": jobId},
    );
  }

  Future<void> fetchData() async {
    await getJobAplication(); // ثم جلب كل الوظائف
  }

  Future<void> getJobAplication() async {
    listJobApplication.clear();
    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await jobApplicationData.getAllJobApplication();
      statusRequest = hindlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          List listData = response["data"];
          listJobApplication
              .addAll(listData.map((e) => ViewJobAppModel.fromJson(e)));

          // جلب قائمة المفضلات أولاً
          await getMyViewFavorite();

          // ✅ جلب اللايكات والتعليقات لكل إعلان
          for (var job in listJobApplication) {
            if (job.jobId != null) {
              await getLikesCount(job.jobId!);
              await getCommentsCount(job.jobId!);
              await getComments(job.jobId!); // ✅ إضافة هذا السطر
            }
          }

          // طباعة للمساعدة في تحديد المشكلة
          print(
              "All jobs IDs: ${listJobApplication.map((e) => e.jobId).toList()}");
          print(
              "Favorite jobs IDs: ${dataFavoriteJob.map((e) => e.jobId).toList()}");

          // تهيئة isFavorites لكل عنصر بناءً على dataFavoriteJob
          for (var job in listJobApplication) {
            if (job.jobId != null) {
              // التحقق إذا كان jobId موجود في قائمة المفضلات
              bool isFavorite = dataFavoriteJob.any((fav) {
                print(
                    "Comparing: ${fav.jobId} == ${job.jobId}, result: ${fav.jobId == job.jobId}");
                return fav.jobId == job.jobId;
              });

              isFavorites[job.jobId!] = isFavorite ? 1 : 0;
              print("Job ${job.jobId} is favorite: $isFavorite");
            }
          }
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

  Future<void> getMyViewFavorite() async {
    try {
      var response = await viewFavoriteJobAppData
          .getViewFavorite(myServices.sharedPreferences.getInt("idUser")!);

      if (hindlingData(response) == StatusRequest.success &&
          response["status"] == "success") {
        List responseData = response["data"];

        // طباعة البيانات الخام للمساعدة في التصحيح
        print("Raw favorite data: $responseData");

        dataFavoriteJob = responseData.map((e) {
          // إنشاء نموذج من البيانات
          var model = ViewJobAppModel.fromJson(e);

          // إذا كان هناك حقل job_id في البيانات، نستخدمه
          if (e['job_id'] != null) {
            model.jobId = e['job_id'];
          }

          return model;
        }).toList();
      }
    } catch (e) {
      print("Error fetching favorites: $e");
    }
  }

  void toggleFavorite(int? jobId) async {
    if (jobId == null) {
      print("Job ID is null");
      return;
    }

    // التأكد من وجود jobId في isFavorites
    if (!isFavorites.containsKey(jobId)) {
      isFavorites[jobId] = 0;
    }

    if (isFavorites[jobId] == 1) {
      isFavorites[jobId] = 0;
      await removeFavorite(jobId);
    } else {
      isFavorites[jobId] = 1;
      await addFavorite(jobId);
    }
    update();
  }

  Future<void> addFavorite(int appid) async {
    try {
      var response = await viewFavoriteJobAppData.postAddFavorite(
          myServices.sharedPreferences.getInt("idUser")!, appid);
      if (hindlingData(response) == StatusRequest.success &&
          response["status"] == "success") {
        showInfoDialog("40".tr, "180".tr, autoHid: Duration(seconds: 3));
      }
    } catch (e) {
      print("Error adding favorite: $e");
    }
  }

  Future<void> removeFavorite(int appid) async {
    try {
      var response = await viewFavoriteJobAppData.postRemoveFavorite(
          myServices.sharedPreferences.getInt("idUser")!, appid);
      if (hindlingData(response) == StatusRequest.success &&
          response["status"] == "success") {
        showInfoDialog("182".tr, "181".tr, autoHid: Duration(seconds: 3));
      }
    } catch (e) {
      print("Error removing favorite: $e");
    }
  }

  Future<void> refreshData() async {
    await fetchData();
  }

  @override
  void onInit() async {
    super.onInit();
    await getJobAplication();
    print("Total jobs: ${listJobApplication.length}");
    print("Favorite jobs: ${dataFavoriteJob.length}");
    print("isFavorites map: $isFavorites");
  }

  /// ------------------ لايكات ------------------

  /// التعليقات لكل jobId
  var commentsList = <int, List<CommentModel>>{}.obs; // RxMap
  var commentsCount = <int, int>{}.obs; // RxMap

  /// لايكات
  Map<int, bool> isLiked = {}; // jobId -> true/false
  Map<int, int> likesCount = {}; // jobId -> count

  ItemsData itemsData = ItemsData(Get.find());

  /// ------------------ لايكات ------------------
  getLikesCount(int jobId) async {
    try {
      var response = await itemsData.getLikesCount({
        "target_type": "jobApp",
        "target_id": jobId.toString(),
        "user_id": myServices.sharedPreferences.getInt("idUser").toString(),
      });

      if (response is Map<String, dynamic>) {
        if (response["status"] == "success") {
          likesCount[jobId] = response["likes_count"] ?? 0;
          isLiked[jobId] = response["user_liked"] ?? false;
        }
      }
    } catch (e) {
      likesCount[jobId] = 0;
      isLiked[jobId] = false;
      print("Error fetching likes: $e");
    }
    update();
  }

  toggleLike(int jobId) async {
    try {
      if (isLiked[jobId] == true) {
        var response = await itemsData.deleteLike({
          "target_type": "jobApp",
          "target_id": jobId.toString(),
          "user_id": myServices.sharedPreferences.getInt("idUser").toString(),
        });
        if (response is Map<String, dynamic> &&
            response["status"] == "success") {
          likesCount[jobId] = (likesCount[jobId] ?? 1) - 1;
          isLiked[jobId] = false;
        }
      } else {
        var response = await itemsData.addLike({
          "target_type": "jobApp",
          "target_id": jobId.toString(),
          "user_id": myServices.sharedPreferences.getInt("idUser").toString(),
          "created_at": DateTime.now().toString(),
        });
        if (response is Map<String, dynamic> &&
            response["status"] == "success") {
          likesCount[jobId] = (likesCount[jobId] ?? 0) + 1;
          isLiked[jobId] = true;
        }
      }
    } catch (e) {
      print("Error toggling like: $e");
    }
    update();
  }

  /// ------------------ التعليقات ------------------

  /// جلب عدد التعليقات
  getCommentsCount(int jobId) async {
    try {
      var response = await itemsData.getCommentsCount({
        "target_type": "jobApp",
        "target_id": jobId.toString(),
      });
      if (response is Map<String, dynamic> && response["status"] == "success") {
        commentsCount[jobId] = response["comments_count"] ?? 0;
      }
    } catch (e) {
      commentsCount[jobId] = 0;
      print("Error fetching comments count: $e");
    }
    update();
  }

  /// جلب التعليقات (لكل jobId)
  // جلب التعليقات
  getComments(int jobId) async {
    try {
      commentsList[jobId] = [];
      var response = await itemsData.getComments({
        "target_type": "jobApp",
        "target_id": jobId.toString(),
      });

      if (response is Map<String, dynamic> && response["status"] == "success") {
        List data = response["data"];
        List<CommentModel> fetchedComments =
            data.map((e) => CommentModel.fromJson(e)).toList();
        commentsList[jobId] = fetchedComments;
      }
    } catch (e) {
      print("Error fetching comments: $e");
      commentsList[jobId] = [];
    }
    update();
  }

  Future<void> addComment(int jobId, String content, {int? parentId}) async {
    try {
      var response = await itemsData.addComment({
        "user_id": myServices.sharedPreferences.getInt("idUser").toString(),
        "target_type": "jobApp",
        "target_id": jobId.toString(),
        "content": content,
        "parent_id": parentId?.toString() ?? "",
        "created_at": DateTime.now().toString(),
      });

      if (response is Map<String, dynamic> && response["status"] == "success") {
        await getComments(jobId);
        await getCommentsCount(jobId);
      }
    } catch (e) {
      print("Error adding comment: $e");
    }
  }

  Future<void> editComment(int jobId, String commentId, String content) async {
    try {
      var response = await itemsData.editComment({
        "comment_id": commentId,
        "user_id": myServices.sharedPreferences.getInt("idUser").toString(),
        "content": content,
      });
      if (response is Map<String, dynamic> && response["status"] == "success") {
        await getComments(jobId);
      }
    } catch (e) {
      print("Error editing comment: $e");
    }
  }

  Future<void> deleteComment(int jobId, String commentId) async {
    try {
      var response = await itemsData.deleteComment({
        "comment_id": commentId,
        "user_id": myServices.sharedPreferences.getInt("idUser").toString(),
      });
      if (response is Map<String, dynamic> && response["status"] == "success") {
        await getComments(jobId);
        await getCommentsCount(jobId);
      }
    } catch (e) {
      print("Error deleting comment: $e");
    }
  }

  RxMap<int, int> shareCount = <int, int>{}.obs; // عداد المشاركة لكل وظيفة

  // باقي المتغيرات والطرق موجودة مسبقًا

  void incrementShareCount(int jobId) {
    shareCount[jobId] = (shareCount[jobId] ?? 0) + 1;
  }

  Future<ViewJobAppModel?> getJobApplicationById(int jobId) async {
    print("-*********-----1----------");
    try {
      print("-*********-----1----------");
      var response = await jobApplicationData.getJobApplicationId(jobId);
      if (response["status"] == "success" && response["data"] != null) {
        print("-*********-----2----------");
        return ViewJobAppModel.fromJson(response["data"]);
      }
      print("-*********-----3----------");
    } catch (e) {
      print("Error fetching job opportunity by id: $e");
      print("-*********-----4----------");
    }
    print("-*********-----5----------");

    return null;
  }
}
