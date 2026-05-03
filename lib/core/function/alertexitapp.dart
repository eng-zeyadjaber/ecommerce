import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() async {
  return await Get.dialog(
        Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: AppTextColor.white,

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// 🔥 أيقونة
                Icon(Icons.exit_to_app, size: 50, color: AppTextColor.primary),

                const SizedBox(height: 15),

                /// العنوان
                Text(
                  "exit_title".tr,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppTextColor.primary,
                  ),
                ),

                const SizedBox(height: 10),

                /// الوصف
                Text(
                  "exit_body".tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppTextColor.grey, height: 1.5),
                ),

                const SizedBox(height: 25),

                /// الأزرار
                Row(
                  children: [
                    /// زر إلغاء
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppTextColor.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Get.back(result: false);
                        },
                        child: Text(
                          "exit_no".tr,
                          style: const TextStyle(color: AppTextColor.primary),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    /// زر خروج
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTextColor.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Get.back(result: true);
                        },
                        child: Text(
                          "exit_yes".tr,
                          style: const TextStyle(color: AppTextColor.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ) ??
      false;
}
