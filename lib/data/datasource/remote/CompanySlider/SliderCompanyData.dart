import '../../../../LinkApp.dart';
import '../../../../core/class/CRUD.dart';

class SlidersCompanyData {
  CRUD crud;
  SlidersCompanyData(this.crud);

  // postData for send data

  getSlidersCompany() async {
    var response = await crud.postData(LinkApp.viewsliderscompany, {});
    return response.fold((l) => l, (r) => r);
  }
}
