import 'package:ecommercecourse/controller/forgetpass/verify_code_ctrl.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCodeBoxes extends StatelessWidget {

  final VerifyCodeController controller;

  const VerifyCodeBoxes({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VerifyCodeController>();

    final focusNodes = List.generate(5, (_) => FocusNode());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        5,
        (index) => SizedBox(
          width: 55,
          child: TextField(
            controller: controller.codeControllers[index],
            focusNode: focusNodes[index],

            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,

            style: const TextStyle(
              color: AppTextColor.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),

            onChanged: (value) {
              /// تحديث حالة الزر
              controller.checkCode();

              /// انتقال تلقائي
              if (value.isNotEmpty) {
                if (index < 4) {
                  FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                }
              } else {
                if (index > 0) {
                  FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                }
              }
            },

            decoration: InputDecoration(
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
