import 'package:ecomerce1/core/class/crud.dart';
import 'package:ecomerce1/linkapi.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  postData(String username, String password, String email, String phone) async {
    var response = await crud.postData(AppLink.signup, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
