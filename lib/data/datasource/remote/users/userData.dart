import '../../../../LinkApp.dart';
import '../../../../core/class/CRUD.dart';

class UserData {
  CRUD crud;
  UserData(this.crud);
  getData(int userid) async {
    var response = await crud.postData(LinkApp.viewUser, {
      "userid": userid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  editData(Map data) async {
    var response = await crud.postData(LinkApp.editUser, data);
    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var response = await crud.postData(LinkApp.deleteUser, data);
    return response.fold((l) => l, (r) => r);
  }
}
