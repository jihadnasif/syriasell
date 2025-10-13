import 'package:get/get.dart';
import 'package:syria_sell/core/functions/hindlingData.dart';
import 'package:syria_sell/data/datasource/remote/Items/itemData.dart';
import 'package:syria_sell/data/model/allViewItemsModel.dart';

import '../../LinkApp.dart';
import '../../core/class/StatusRequest.dart';
import '../../core/functions/Dialog.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/Favorite/viewAndDeletFavoriteData.dart';
import '../../data/model/CommentModel.dart';
import '../../data/model/FavoriteModel.dart';

class ItemDetailsController extends GetxController {
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  ItemsData itemsData = ItemsData(Get.find());
  //late String itemsId;
  RxString itemsId = "".obs;
  ViewItemsAllModel? viewItemsAllModel;
  List<String> imagesSlider = [];
  ViewFavoriteData favoriteData = ViewFavoriteData(Get.find());
  List<ViewFavoriteModel> dataFavorite = [];
  Map isFavorites = {};

  /// التعليقات
  List<CommentModel> commentsList = [];
  RxInt commentsCount = 0.obs;

  /// لايكات
  RxInt likesCount = 0.obs;
  RxBool isLiked = false.obs;
  RxInt shareCount = 0.obs;

  /// جلب المفضلات
  getMyViewFavorite() async {
    try {
      dataFavorite.clear();
      var response = await favoriteData
          .getViewFavorite(myServices.sharedPreferences.getInt("idUser")!);

      if (hindlingData(response) == StatusRequest.success &&
          response["status"] == "success") {
        List responseData = response["data"];
        dataFavorite
            .addAll(responseData.map((e) => ViewFavoriteModel.fromJson(e)));

        for (var fav in dataFavorite) {
          isFavorites[fav.favoriteItemsid] = 1;
        }
      }
    } catch (e) {
      print("Error fetching favorites: $e");
    }
    update();
  }

  /// جلب تفاصيل الإعلان
  getItemDetails() async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await itemsData.getItemId({"itemsid": itemsId.value});
      statusRequest = hindlingData(response);

      if (statusRequest == StatusRequest.success &&
          response["status"] == "success" &&
          response["data"].isNotEmpty) {
        viewItemsAllModel = ViewItemsAllModel.fromJson(response["data"][0]);

        /// صور
        imagesSlider = [];
        final imageFields = [
          viewItemsAllModel?.imageOne,
          viewItemsAllModel?.imageTwo,
          viewItemsAllModel?.imageThree,
          viewItemsAllModel?.imageFour,
        ];
        for (var img in imageFields) {
          if (img != null &&
              img.trim().isNotEmpty &&
              img.toLowerCase() != "null") {
            imagesSlider.add("${LinkApp.uploadItems}$img");
          }
        }
        if (imagesSlider.length == 1) {
          imagesSlider = [imagesSlider.first];
        }

        /// مفضلة + لايك + تعليقات
        await getMyViewFavorite();
        await getLikesCount();
        await getComments();
        await getCommentsCount();

        isFavorites[viewItemsAllModel!.itemId] =
            isFavorites[viewItemsAllModel!.itemId] ?? 0;

        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      print("Error fetching item details: $e");
      statusRequest = StatusRequest.serverfException;
    }

    update();
  }

  /// مفضلة محلي
  setFavorite(id, val) {
    isFavorites[id] = val;
    update();
  }

  /// إضافة للمفضلة
  addFavorite(int itemsid) async {
    try {
      var response = await favoriteData.postAddFavorite(
          myServices.sharedPreferences.getInt("idUser")!, itemsid);
      if (hindlingData(response) == StatusRequest.success &&
          response["status"] == "success") {
        showInfoDialog("40".tr, "180".tr, autoHid: Duration(seconds: 3));
      }
    } catch (e) {
      print("Error adding favorite: $e");
    }
    update();
  }

  /// إزالة من المفضلة
  removeFavorite(int itemsid) async {
    try {
      var response = await favoriteData.postRemoveFavorite(
          myServices.sharedPreferences.getInt("idUser")!, itemsid);
      if (hindlingData(response) == StatusRequest.success &&
          response["status"] == "success") {
        showInfoDialog("182".tr, "181".tr, autoHid: Duration(seconds: 3));
      }
    } catch (e) {
      print("Error removing favorite: $e");
    }
    update();
  }

  Future<void> refreshData() async {
    itemsId = Get.arguments['itemsId'];
    getItemDetails();
  }

  void updateItemId(String newId) {
    if (itemsId.value != newId) {
      itemsId.value = newId;
      getItemDetails();
    }
  }

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments['itemsId'] != null) {
      itemsId.value = Get.arguments['itemsId'];
      getItemDetails();
    }
  }

  /// ------------------ لايكات ------------------
  getLikesCount() async {
    try {
      var response = await itemsData.getLikesCount({
        "target_type": "item",
        "target_id": viewItemsAllModel!.itemId.toString(),
        "user_id": myServices.sharedPreferences.getInt("idUser").toString(),
      });

      if (response is Map<String, dynamic>) {
        if (response["status"] == "success") {
          likesCount.value = response["likes_count"] ?? 0;
          isLiked.value = response["user_liked"] ?? false;
        }
      }
    } catch (e) {
      likesCount.value = 0;
      isLiked.value = false;
      print("Error fetching likes: $e");
    }
    update();
  }

  toggleLike() async {
    try {
      if (isLiked.value) {
        var response = await itemsData.deleteLike({
          "target_type": "item",
          "target_id": viewItemsAllModel!.itemId.toString(),
          "user_id": myServices.sharedPreferences.getInt("idUser").toString(),
        });
        if (response is Map<String, dynamic> &&
            response["status"] == "success") {
          likesCount.value--;
          isLiked.value = false;
        }
      } else {
        var response = await itemsData.addLike({
          "target_type": "item",
          "target_id": viewItemsAllModel!.itemId.toString(),
          "user_id": myServices.sharedPreferences.getInt("idUser").toString(),
          "created_at": DateTime.now().toString(),
        });
        if (response is Map<String, dynamic> &&
            response["status"] == "success") {
          likesCount.value++;
          isLiked.value = true;
        }
      }
    } catch (e) {
      print("Error toggling like: $e");
    }
  }

  /// ------------------ التعليقات ------------------

  /// جلب التعليقات
  getComments() async {
    try {
      commentsList.clear();
      var response = await itemsData.getComments({
        "target_type": "item",
        "target_id": viewItemsAllModel!.itemId.toString(),
      });

      if (response is Map<String, dynamic> && response["status"] == "success") {
        List data = response["data"];
        commentsList.addAll(data.map((e) => CommentModel.fromJson(e)));
      }
    } catch (e) {
      print("Error fetching comments: $e");
    }
    update();
  }

  /// جلب عدد التعليقات
  getCommentsCount() async {
    try {
      var response = await itemsData.getCommentsCount({
        "target_type": "item",
        "target_id": viewItemsAllModel!.itemId.toString(),
      });
      if (response is Map<String, dynamic> && response["status"] == "success") {
        commentsCount.value = response["comments_count"] ?? 0;
      }
    } catch (e) {
      commentsCount.value = 0;
      print("Error fetching comments count: $e");
    }
    update();
  }

  /// إضافة تعليق
  addComment(String content, {int? parentId}) async {
    try {
      var response = await itemsData.addComment({
        "user_id": myServices.sharedPreferences.getInt("idUser").toString(),
        "target_type": "item",
        "target_id": viewItemsAllModel!.itemId.toString(),
        "content": content,
        "parent_id": parentId?.toString() ?? "",
        "created_at": DateTime.now().toString(),
      });
      if (response is Map<String, dynamic> && response["status"] == "success") {
        await getComments();
        await getCommentsCount();
      }
    } catch (e) {
      print("Error adding comment: $e");
    }
  }

  /// تعديل تعليق
  editComment(String commentId, String content) async {
    try {
      var response = await itemsData.editComment({
        "comment_id": commentId,
        "user_id": myServices.sharedPreferences.getInt("idUser").toString(),
        "content": content,
      });
      if (response is Map<String, dynamic> && response["status"] == "success") {
        await getComments();
      }
    } catch (e) {
      print("Error editing comment: $e");
    }
  }

  /// حذف تعليق
  deleteComment(String commentId) async {
    try {
      var response = await itemsData.deleteComment({
        "comment_id": commentId,
        "user_id": myServices.sharedPreferences.getInt("idUser").toString(),
      });
      if (response is Map<String, dynamic> && response["status"] == "success") {
        await getComments();
        await getCommentsCount();
      }
    } catch (e) {
      print("Error deleting comment: $e");
    }
  }
}
