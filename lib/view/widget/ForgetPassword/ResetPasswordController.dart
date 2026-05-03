import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ResetPasswordController extends GetxController {

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool isSuccess = false;

  updatePassword() {

    if(password.text != confirmPassword.text){
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    isSuccess = true;

    update();
  }

}