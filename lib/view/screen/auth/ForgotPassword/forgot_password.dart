import 'package:ecommercecourse/controller/forgetpass/forgot_pass_ctrl.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/function/validinput.dart';
import 'package:ecommercecourse/view/widget/ForgetPassword/forgot_button.dart';
import 'package:ecommercecourse/view/widget/ForgetPassword/forgot_header.dart';
import 'package:ecommercecourse/view/widget/ForgetPassword/forgot_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(elevation: 0, leading: const BackButton()),

      body: GetBuilder<ForgotPasswordController>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),

                child: Form(
                  // 🔥 هنا الحل
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const SizedBox(height: 30),

                      const ForgotHeader(
                        title: "forgot_password_title",
                        body: "forgot_password_body",
                      ),

                      const SizedBox(height: 50),

                      /// Email Field
                      ForgotInput(
                        validator: (val) => validInput(val!, 5, 100, "email"),
                        hint: "email_hint",
                        controller: controller.email,
                        onChanged: (val) => controller.checkInput(val),
                      ),

                      const SizedBox(height: 30),

                      /// Button
                      Obx(
                        () => ForgotButton(
                          text: "reset_password".tr,
                          onPressed: controller.isButtonEnabled.value
                              ? controller.checkEmail
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          )
      ),
    );
  }
}
