import 'package:syria_sell/LinkApp.dart';
import 'package:syria_sell/core/class/CRUD.dart';

class SignInData {
  CRUD crud;
  SignInData(this.crud);
  loginData(String phone, String password) async {
    Map<String, String> data = {
      "password": password,
    };

    /*if (email.isNotEmpty) {
      data["email"] = email;
    } else*/
    if (phone.isNotEmpty) {
      data["phone"] = phone;
    }

    var response = await crud.postData(LinkApp.signin, data);
    return response.fold((l) => l, (r) => r);
  }

  test2() async {
    var response = await crud.postData(LinkApp.testData, {});
    return response.fold((l) => l, (r) => r);
  }
}
