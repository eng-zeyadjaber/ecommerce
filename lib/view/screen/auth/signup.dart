import 'package:ecommercecourse/controller/auth/signup_ctrl.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/function/alertexitapp.dart';
import 'package:ecommercecourse/core/function/validinput.dart';
import 'package:ecommercecourse/view/widget/signInAndUp/AuthLinks.dart';
import 'package:ecommercecourse/view/widget/signInAndUp/authButton.dart';
import 'package:ecommercecourse/view/widget/signInAndUp/authHeader.dart';
import 'package:ecommercecourse/view/widget/signInAndUp/authTextForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControllerImp());
    return Scaffold(
      backgroundColor: AppTextColor.primary,
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          const SizedBox(height: 40),

                          const AuthHeader(
                            title: "signup_title",
                            body: "signup_body",
                          ),

                          const SizedBox(height: 30),

                          AuthTextForm(
                            validator: (val) =>
                                validInput(val!, 3, 20, "username"),
                            hint: "Text_username",
                            icon: Icons.person,
                            controller: controller.username,
                          ),

                          const SizedBox(height: 20),

                          AuthTextForm(
                            validator: (val) =>
                                validInput(val!, 9, 15, "phone"),
                            hint: "Text_phone",
                            icon: Icons.phone,
                            controller: controller.phone,
                            keyboardType: TextInputType.phone,
                          ),

                          const SizedBox(height: 20),

                          AuthTextForm(
                            validator: (val) =>
                                validInput(val!, 5, 100, "email"),
                            hint: "Text_email",
                            icon: Icons.email,
                            controller: controller.email,
                            keyboardType: TextInputType.emailAddress,
                          ),

                          const SizedBox(height: 20),

                          AuthTextForm(
                            validator: (val) =>
                                validInput(val!, 6, 30, "password"),
                            hint: "Text_pass",
                            icon: Icons.lock,
                            obscure: true,
                            controller: controller.password,
                          ),

                          const SizedBox(height: 30),

                          AuthButton(
                            text: "Button_signup",
                            onPressed: controller.signUp,
                          ),

                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "have_account".tr,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppTextColor.body,
                                ),
                              ),

                              const SizedBox(width: 5),

                              AuthLinks(
                                text: "login_now",
                                color: AppTextColor.white,
                                onTap: controller.goToLogin,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          )
        ),
      ),
    );
  }
}
