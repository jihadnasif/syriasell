import '../../../../LinkApp.dart';
import '../../../../core/class/CRUD.dart';

class CategoriesData {
  CRUD crud;
  CategoriesData(this.crud);
  getData() async {
    var response = await crud.postData(LinkApp.viewCategories, {});
    return response.fold((l) => l, (r) => r);
  }
}
