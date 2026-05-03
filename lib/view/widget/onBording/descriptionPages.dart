import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionPages extends StatelessWidget {
  final String image;
  final String title;
  final String body;
  final double width;
final double height;
  const DescriptionPages({
    super.key,
    required this.image,
    required this.title,
    required this.body, required this.width, required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: AppTextColor.primary),
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(120),
                ),
              ),
              child: Center(child: Image.asset(image, width: 350)),
            ),
            const SizedBox(height: 40),
            Text(title.tr, style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                body.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
