import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String body;

  const AuthHeader({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Logo
        Image.asset(AppImageAsset.logo, width: 80),

        const SizedBox(height: 35),

        /// Title
        Text(
          title.tr,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.headlineLarge,
        ),

        const SizedBox(height: 20),

        /// Description
        Text(
          body.tr,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
