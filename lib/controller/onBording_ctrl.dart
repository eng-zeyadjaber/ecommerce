import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  late PageController pageController;

  int currentPage = 0;
  MyServices myServices = Get.find();
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  void onPageChanged(int index) {
    currentPage = index;
    update();
  }

  void next() async {
    if (currentPage < onBordingList.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // 🔥 هنا نحفظ
      await myServices.sharedPreferences.setString("step", "1");

      Get.offAllNamed(AppRoute.login);
    }
  }
}
