import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/controller/forgetpass/reset_pass_ctrl.dart';
import 'package:ecommercecourse/core/function/validinput.dart';
import 'package:ecommercecourse/view/widget/ForgetPassword/forgot_button.dart';
import 'package:ecommercecourse/view/widget/ForgetPassword/forgot_header.dart';
import 'package:ecommercecourse/view/widget/ForgetPassword/forgot_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordController());
    return Scaffold(
      backgroundColor: AppTextColor.white,

      appBar: AppBar(
        backgroundColor: AppTextColor.white,
        elevation: 0,
        leading: const BackButton(color: AppTextColor.grey),
      ),

      body: GetBuilder<ResetPasswordController>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),

                child: GetBuilder<ResetPasswordController>(
                  builder: (controller) {
                    /// RESET PASSWORD FORM
                    return ListView(
                      children: [
                        const SizedBox(height: 20),

                        const ForgotHeader(
                          title: "set_new_password",
                          body: "set_new_password_body",
                        ),

                        const SizedBox(height: 40),

                        ForgotInput(
                          validator: (val) =>
                              validInput(val!, 6, 30, "password"),
                          hint: "new_password",
                          controller: controller.password,
                          isPassword: true,
                          onChanged: (_) => controller.checkPasswords(),
                        ),

                        const SizedBox(height: 20),

                        ForgotInput(
                          validator: (val) =>
                              validInput(val!, 6, 30, "password"),
                          hint: "confirm_password",
                          controller: controller.confirmPassword,
                          isPassword: true,
                          onChanged: (_) => controller.checkPasswords(),
                        ),

                        const SizedBox(height: 30),

                        Obx(
                          () => ForgotButton(
                            text: "update_password".tr,
                            onPressed: controller.isButtonEnabled.value
                                ? controller.updatePassword
                                : null,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
          )
      ),
    );
  }
}
