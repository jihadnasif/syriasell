import '../../../../LinkApp.dart';
import '../../../../core/class/CRUD.dart';

class MorePageData {
  CRUD crud;
  MorePageData(this.crud);
  getDataAbout() async {
    var response = await crud.postData(LinkApp.viewAbout, {});
    return response.fold((l) => l, (r) => r);
  }

  getDataPrivacy() async {
    var response = await crud.postData(LinkApp.viewPrivacy, {});
    return response.fold((l) => l, (r) => r);
  }

  getDataTerms() async {
    var response = await crud.postData(LinkApp.viewTerms, {});
    return response.fold((l) => l, (r) => r);
  }

  getDataSupport() async {
    var response = await crud.postData(LinkApp.viewSupport, {});
    return response.fold((l) => l, (r) => r);
  }
}
