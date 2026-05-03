import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/source/static/static.dart';
import 'package:ecommercecourse/view/widget/onBording/Indicator.dart';
import 'package:ecommercecourse/view/widget/onBording/descriptionPages.dart';
import 'package:ecommercecourse/view/widget/onBording/firstPage.dart';
import 'package:get/get.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/widget/onBording/customButton.dart';
import 'package:flutter/material.dart';

class OnBording extends StatefulWidget {
  const OnBording({super.key});

  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  PageController controller = PageController();
  int currentPage = 0;

  bool languageSelected = false;

  void selectLanguage() {
    setState(() {
      languageSelected = true;
    });

    controller.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: controller,

              physics: languageSelected
                  ? const ClampingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),

              onPageChanged: (val) {
                setState(() {
                  currentPage = val;
                });
              },

              itemCount: onBordingList.length,

              itemBuilder: (context, i) {
                /// صفحة اختيار اللغة
                if (i == 0) {
                  if (i == 0) {
                    return OnBoardingFirstPage(
                      onLanguageSelected: selectLanguage,
                    );
                  }
                }

                final item = onBordingList[i];

                return DescriptionPages(
                  image: item.image,
                  title: item.title,
                  body: item.body,
                  width: item.width,
                  height: item.height,
                );
              },
            ),

            /// زر Get Started
            if (languageSelected && currentPage == onBordingList.length - 1)
              Positioned(
                bottom: 100,
                left: 20,
                right: 20,
                child: CustomOnBoardingButton(
                  text: "get_started".tr,
                  onPressed: () async {
                    await Get.find<MyServices>().sharedPreferences.setString(
                      "step",
                      "1",
                    );

                    Get.offAllNamed(AppRoute.login);
                  },
                ),
              ),

            /// النقاط
            if (languageSelected && currentPage != 0)
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: OnBoardingIndicator(
                  currentPage: currentPage - 1,
                  length: onBordingList.length - 1,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
