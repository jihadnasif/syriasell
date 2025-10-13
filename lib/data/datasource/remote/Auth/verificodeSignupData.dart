import '../../../../LinkApp.dart';
import '../../../../core/class/CRUD.dart';

class VerificodeSignupData {
  CRUD crud;
  VerificodeSignupData(this.crud);

  postData(String email, String phone, String virecodeSignup) async {
    Map<String, String> data = {
      "verificode": virecodeSignup,
    };

    if (email.isNotEmpty) {
      data["email"] = email;
    } else if (phone.isNotEmpty) {
      data["phone"] = phone;
    }
    var response = await crud.postData(LinkApp.confirmVerifyCode, data);
    return response.fold((l) => l, (r) => r);
  }

  reSendVerifyCodeData(String email, String phone) async {
    Map<String, String> data = {};

    if (email.isNotEmpty) {
      data["email"] = email;
    } else if (phone.isNotEmpty) {
      data["phone"] = phone;
    }

    var response = await crud.postData(LinkApp.reSendVerifycode, data);
    return response.fold((l) => l, (r) => r);
  }
}
