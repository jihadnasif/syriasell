import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../../../LinkApp.dart';
import '../../../../core/class/CRUD.dart';

class ItemsData {
  CRUD crud;
  ItemsData(this.crud);

  // جلب جميع المنتجات
  Future<dynamic> getData() async {
    var response = await crud.postData(LinkApp.viewItem, {});
    return response.fold((l) => l, (r) => r);
  }

  //جلب عنصر محدد
  getItemId(Map data) async {
    var response = await crud.postData(LinkApp.viewItemId, data);
    return response.fold((l) => l, (r) => r);
  }

  // إضافة منتج: صورة إلزامية + 3 صور اختيارية
  Future<dynamic> addData(
    Map data,
    File imageOne, {
    File? imageTwo,
    File? imageThree,
    File? imageFour,
  }) async {
    var response = await crud.addRequestWithImages(
      LinkApp.addItem,
      data,
      imageOne,
      imageTwo: imageTwo,
      imageThree: imageThree,
      imageFour: imageFour,
    );
    return response.fold((l) => l, (r) => r);
  }

  // تعديل منتج: يمكن تعديل البيانات فقط أو رفع أي صورة جديدة
  Future<dynamic> editData(
    Map data, {
    File? imageOne,
    File? imageTwo,
    File? imageThree,
    File? imageFour,
  }) async {
    // إذا لم يتم تمرير أي صورة → تعديل البيانات فقط
    bool hasImage = imageOne != null ||
        imageTwo != null ||
        imageThree != null ||
        imageFour != null;

    var response;
    if (!hasImage) {
      response = await crud.postData(LinkApp.editItem, data);
    } else {
      // إذا تم تمرير أي صورة → الصورة الأساسية imageOne إلزامية
      if (imageOne == null) {
        throw Exception("imageOne is required when updating images");
      }
      response = await crud.addRequestWithImages(
        LinkApp.editItem,
        data,
        imageOne,
        imageTwo: imageTwo,
        imageThree: imageThree,
        imageFour: imageFour,
      );
    }
    return response.fold((l) => l, (r) => r);
  }

  // حذف منتج
  Future<dynamic> deleteData(Map data) async {
    var response = await crud.postData(LinkApp.deleteItem, data);
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(LinkApp.searchItems, {
      "search": search,
    });
    return response.fold((l) => l, (r) => r);
  }

  addLike(Map data) async {
    var response = await crud.postData(LinkApp.addLike, data);
    return response.fold((l) => l, (r) => r);
  }

  deleteLike(Map data) async {
    var response = await crud.postData(LinkApp.deleteLike, data);
    return response.fold((l) => l, (r) => r);
  }

  getLikesCount(Map data) async {
    var response = await crud.postData(LinkApp.countLike, data);
    return response.fold((l) => l, (r) => r);
  }

  getComments(Map data) async {
    var response = await crud.postData(LinkApp.getComments, data);
    return response.fold((l) => l, (r) => r);
  }

  addComment(Map data) async {
    var response = await crud.postData(LinkApp.addComment, data);
    return response.fold((l) => l, (r) => r);
  }

  deleteComment(Map data) async {
    var response = await crud.postData(LinkApp.deleteComment, data);
    return response.fold((l) => l, (r) => r);
  }

  editComment(Map data) async {
    var response = await crud.postData(LinkApp.updateComment, data);
    return response.fold((l) => l, (r) => r);
  }

  getCommentsCount(Map data) async {
    var response = await crud.postData(LinkApp.getCommentsCount, data);
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> addDataWeb(
    Map data,
    Uint8List imageOne, {
    Uint8List? imageTwo,
    Uint8List? imageThree,
    Uint8List? imageFour,
  }) async {
    var response = await crud.addRequestWithWebImages(
      LinkApp.addItem,
      data,
      imageOne,
      imageTwo: imageTwo,
      imageThree: imageThree,
      imageFour: imageFour,
    );
    return response.fold((l) => l, (r) => r);
  }
}
