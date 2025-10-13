import '../../../../LinkApp.dart';
import '../../../../core/class/CRUD.dart';

class ItemsCategoryIdData {
  CRUD crud;
  ItemsCategoryIdData(this.crud);

  //جلب عنصر محدد
  getItemsCategId(Map data) async {
    var response = await crud.postData(LinkApp.viewItemsCategId, data);
    return response.fold((l) => l, (r) => r);
  }
}
