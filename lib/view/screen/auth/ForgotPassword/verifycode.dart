import 'package:ecommercecourse/controller/forgetpass/verify_code_ctrl.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/ForgetPassword/forgot_button.dart';
import 'package:ecommercecourse/view/widget/ForgetPassword/forgot_header.dart';
import 'package:ecommercecourse/view/widget/ForgetPassword/verify_code_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeController());
    return Scaffold(
      backgroundColor: AppTextColor.white,

      appBar: AppBar(
        backgroundColor: AppTextColor.white,
        elevation: 0,
        leading: const BackButton(color: AppTextColor.grey),
      ),

      body: GetBuilder<VerifyCodeController>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),

                child: ListView(
                  children: [
                    const SizedBox(height: 30),

                    const ForgotHeader(
                      title: "verify_code_title",
                      body: "verify_code_body",
                    ),

                    const SizedBox(height: 50),

                    VerifyCodeBoxes(controller: controller),

                    const SizedBox(height: 40),

                    Obx(
                      () => ForgotButton(
                        text: "verify_code".tr,
                        onPressed: controller.isButtonEnabled.value
                            ? controller.submit
                            : null,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Center(
                      child: InkWell(
                        onTap: () {},

                        child: Text(
                          "resend_email".tr,
                          style: const TextStyle(
                            color: AppTextColor.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          )
      ),
    );
  }
}
