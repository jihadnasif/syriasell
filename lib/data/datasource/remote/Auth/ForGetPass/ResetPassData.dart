import 'package:syria_sell/LinkApp.dart';
import 'package:syria_sell/core/class/CRUD.dart';

class ResetPassData {
  CRUD crud;
  ResetPassData(this.crud);
  postData(String email, String phone, String password) async {
    Map<String, String> data = {
      "password": password,
    };

    if (email.isNotEmpty) {
      data["email"] = email;
    } else if (phone.isNotEmpty) {
      data["phone"] = phone;
    }

    var response = await crud.postData(LinkApp.resetPass, data);
    return response.fold((l) => l, (r) => r);
  }
}
