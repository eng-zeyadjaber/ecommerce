import 'package:ecommercecourse/controller/auth/login_ctrl.dart';
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

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginControllerImp());
    return Scaffold(
      backgroundColor: AppTextColor.primary,
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const SizedBox(height: 60),

                      const AuthHeader(
                        title: "login_title",
                        body: "login_body",
                      ),

                      const SizedBox(height: 70),

                      AuthTextForm(
                        validator: (val) => validInput(val!, 5, 100, "email"),
                        hint: "Text_email",
                        icon: Icons.email,
                        controller: controller.email,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      const SizedBox(height: 20),

                      AuthTextForm(
                        validator: (val) => validInput(val!, 6, 30, "password"),
                        hint: "Text_pass",
                        icon: Icons.lock,
                        obscure: true,
                        controller: controller.password,
                      ),

                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AuthLinks(
                            text: "forgot_password",
                            color: Colors.redAccent,
                            onTap: controller.goToForgotPassword,
                          ),

                          AuthLinks(
                            text: "create_account",
                            onTap: controller.goToSignUp,
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      AuthButton(
                        text: "Button_login",
                        onPressed: controller.login,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
