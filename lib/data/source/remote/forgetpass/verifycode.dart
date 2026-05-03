import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class VerifyCodeForgetPassData {
  CRUD crud;
  VerifyCodeForgetPassData(this.crud);
  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verifycodeforgetpass, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
