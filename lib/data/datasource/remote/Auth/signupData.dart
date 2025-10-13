import 'package:syria_sell/LinkApp.dart';
import 'package:syria_sell/core/class/CRUD.dart';

class SignupData {
  CRUD crud;
  SignupData(this.crud);
  postData(String username, String password, String phone) async {
    print("Signup request => ${LinkApp.signup}");
    print("Data => {username: $username, password: $password, phone: $phone}");
    var response = await crud.postData(LinkApp.signup, {
      "username": username,
      "password": password,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
