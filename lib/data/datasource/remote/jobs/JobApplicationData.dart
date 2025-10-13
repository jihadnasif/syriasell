import '../../../../LinkApp.dart';
import '../../../../core/class/CRUD.dart';

class JobApplicationsData {
  CRUD crud;

  JobApplicationsData(this.crud);
  // جلب جميع المنتجات
  Future<dynamic> getAllJobApplication() async {
    var response = await crud.postData(LinkApp.viewallJobApplication, {});
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> getJobApplicationId(int jobid) async {
    var response = await crud
        .postData(LinkApp.viewJobApplicationId, {"jobid": jobid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  //جلب عناصر المستخدم
  getUserId(Map data) async {
    var response = await crud.postData(LinkApp.viewJobApplicationUser, data);
    return response.fold((l) => l, (r) => r);
  }

  // إضافة منتج: صورة إلزامية + 3 صور اختيارية
  Future<dynamic> addJobApplication(Map data) async {
    var response = await crud.postData(LinkApp.addJobApplication, data);
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> editJobApplication(Map data) async {
    var response;
    response = await crud.postData(LinkApp.editJobApplication, data);
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> deleteApplication(Map data) async {
    var response = await crud.postData(LinkApp.deleteJobApplication, data);
    return response.fold((l) => l, (r) => r);
  }
}
