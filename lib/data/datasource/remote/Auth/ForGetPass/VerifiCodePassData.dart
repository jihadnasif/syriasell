import 'package:syria_sell/LinkApp.dart';
import 'package:syria_sell/core/class/CRUD.dart';

class VerifiCodePassData {
  CRUD crud;
  VerifiCodePassData(this.crud);
  postData(String email, String phone, String verificode) async {
    Map<String, String> data = {
      "verificode": verificode,
    };

    if (email.isNotEmpty) {
      data["email"] = email;
    } else if (phone.isNotEmpty) {
      data["phone"] = phone;
    }
    var response = await crud.postData(LinkApp.verifiCodePass, data);
    return response.fold((l) => l, (r) => r);
  }

  reSendVerifyCodeData(String phone) async {
    var response = await crud.postData(LinkApp.reSendVerifycode, {
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
