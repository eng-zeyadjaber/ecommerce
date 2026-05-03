import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    super.initState();

    // 🔥 الانتقال بعد كم ثانية
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoute.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    String? type = Get.arguments?["type"];

    return Scaffold(
      backgroundColor: AppTextColor.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 120,
              color: AppTextColor.primary,
            ),

            const SizedBox(height: 20),

            Text(
              "success".tr,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              type == "signup" ? "account_created".tr : "password_changed".tr,
            ),
          ],
        ),
      ),
    );
  }
}
