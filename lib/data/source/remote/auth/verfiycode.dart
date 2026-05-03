import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class VerifyCodeData {
  CRUD crud;
  VerifyCodeData(this.crud);

  Future<dynamic> postData(
    String email,
    String verifycode,
    String type,
  ) async {
    var response = await crud.postData(
      AppLink.verifycodesignup,
      {
        "email": email,
        "verifycode": verifycode,
        "type": type, // 🔥 مهم
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}