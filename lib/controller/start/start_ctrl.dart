import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:get/get.dart';

class StartController extends GetxController {
  MyServices myServices = Get.find();

  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration.zero, () {
      if (myServices.sharedPreferences.getBool("onboarding") == true) {
        Get.offAllNamed(AppRoute.login);
      } else {
        Get.offAllNamed(AppRoute.onBoarding);
      }
    });
  }
}