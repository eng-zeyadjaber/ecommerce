import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class ResetPassForgetPassData {
  CRUD crud;
  ResetPassForgetPassData(this.crud);

  postData(String email, String newpass) async {
    var response = await crud.postData(AppLink.resetpass, {
      "email": email,
      "newpass": newpass,
    });
    return response.fold((l) => l, (r) => r);
  }
}
