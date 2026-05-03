import 'package:ecommercecourse/controller/home_ctrl.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeControllerImp>();

    return Drawer(
      backgroundColor: AppTextColor.primary,
      child: SafeArea(
        child: Column(
          children: [
            /// 🔴 زر الخروج أعلى يسار
            Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Get.defaultDialog(
                      title: "تنبيه",
                      middleText: "هل تريد تسجيل الخروج؟",
                      backgroundColor: AppTextColor.primary,
                      textConfirm: "نعم",
                      textCancel: "إلغاء",
                      titleStyle: TextStyle(color: AppTextColor.body),
                      middleTextStyle: TextStyle(color: AppTextColor.body),
                      confirmTextColor: AppTextColor.primary,
                      cancelTextColor: AppTextColor.body,
                      buttonColor: AppTextColor.body,
                      onConfirm: () => controller.logout(),
                    );
                  },
                  child: const Icon(Icons.logout),
                ),
              ),
            ),

            /// 🔥 باقي المحتوى لاحقاً
          ],
        ),
      ),
    );
  }
}
