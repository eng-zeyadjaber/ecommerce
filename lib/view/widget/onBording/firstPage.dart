import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:ecommercecourse/view/widget/language/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingFirstPage extends StatelessWidget {

  final VoidCallback onLanguageSelected;

  const OnBoardingFirstPage({
    super.key,
    required this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTextColor.primary,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset(
                AppImageAsset.logo,
                width: 80,
              ),

              const SizedBox(height: 30),

              Text(
                "choose_language".tr,
                style: const TextStyle(
                  fontSize: 24,
                  color: AppTextColor.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 50),

              LanguageButtons(
                onLanguageSelected: onLanguageSelected,
              ),

            ],
          ),
        ),
      ),
    );
  }
}