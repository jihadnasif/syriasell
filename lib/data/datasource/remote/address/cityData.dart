import '../../../../LinkApp.dart';
import '../../../../core/class/CRUD.dart';

class CityData {
  CRUD crud;
  CityData(this.crud);
  getData() async {
    var response = await crud.postData(LinkApp.viewCity, {});
    return response.fold((l) => l, (r) => r);
  }
}
