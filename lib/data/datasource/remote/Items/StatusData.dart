import '../../../../LinkApp.dart';
import '../../../../core/class/CRUD.dart';

class StatusData {
  CRUD crud;
  StatusData(this.crud);
  getData() async {
    var response = await crud.postData(LinkApp.viewStatus, {});
    return response.fold((l) => l, (r) => r);
  }
}
