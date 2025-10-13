import 'dart:io';
import 'dart:typed_data';

import '../../../../LinkApp.dart';
import '../../../../core/class/CRUD.dart';

class JobOpportunitiesData {
  CRUD crud;
  JobOpportunitiesData(this.crud);

  // جلب جميع المنتجات
  Future<dynamic> getAllJobOpportunities() async {
    var response = await crud.postData(LinkApp.viewallJobOpportunities, {});
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> getJobOpportunityId(int jobid) async {
    var response = await crud
        .postData(LinkApp.viewJobOpportunitiesId, {"jobid": jobid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  //جلب عناصر المستخدم
  getUserId(Map data) async {
    var response = await crud.postData(LinkApp.viewJobOpportunitiesUser, data);
    return response.fold((l) => l, (r) => r);
  }

  // إضافة منتج: صورة إلزامية + 3 صور اختيارية
  Future<dynamic> addJobOpportunity(Map data, File? file) async {
    var response = await crud.addRequestWithImageOne(
      LinkApp.addJobOpportunity,
      data,
      file, // هنا يمكن أن يكون null
    );
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> addJobOpportunityWeb(
      Map data, Uint8List? fileBytes, String? fileName) async {
    // استدعاء نفس الأسلوب كما في addJobOpportunity
    var response = await crud.addRequestWithImageOneWeb(
      LinkApp.addJobOpportunity,
      data,
      fileBytes,
      fileName, // يمكن أن يكون null
    );

    // نفس طريقة التعامل مع fold
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> editJobOpportunity(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(LinkApp.editJobOpportunity, data);
    } else {
      response = await crud.addRequestWithImageOne(
          LinkApp.editJobOpportunity, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> deleteJobOpportunity(Map data) async {
    var response = await crud.postData(LinkApp.deleteJobOpportunity, data);
    return response.fold((l) => l, (r) => r);
  }
}
