import 'package:ecommercecourse/core/localization/changelocal.dart';
import 'package:ecommercecourse/view/widget/onBording/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageButtons extends StatelessWidget {
  final VoidCallback onLanguageSelected;

  const LanguageButtons({super.key, required this.onLanguageSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomOnBoardingButton(
          text: "English",
          onPressed: () {
            LocaleController controller = Get.find();
            controller.changeLang("en");
            onLanguageSelected();
          },
        ),

        const SizedBox(height: 20),

        CustomOnBoardingButton(
          text: "العربية",
          onPressed: () {
            LocaleController controller = Get.find();
            controller.changeLang("ar");
            onLanguageSelected();
          },
        ),
      ],
    );
  }
}
