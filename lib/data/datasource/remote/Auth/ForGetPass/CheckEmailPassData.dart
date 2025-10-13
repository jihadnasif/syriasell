import 'package:syria_sell/LinkApp.dart';
import 'package:syria_sell/core/class/CRUD.dart';

class CheckEmailPassData {
  CRUD crud;
  CheckEmailPassData(this.crud);
  postData(String email, String phone) async {
    Map<String, String> data = {};

    if (email.isNotEmpty) {
      data["email"] = email;
    } else if (phone.isNotEmpty) {
      data["phone"] = phone;
    }

    var response = await crud.postData(LinkApp.checkEmailPass, data);
    return response.fold((l) => l, (r) => r);
  }
}
