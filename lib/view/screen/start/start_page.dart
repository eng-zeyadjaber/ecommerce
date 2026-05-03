import 'package:ecommercecourse/controller/start/start_ctrl.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StartController());

    return const Scaffold(
      backgroundColor: AppTextColor.primary,
      body: Center(
        child: CircularProgressIndicator(color: AppTextColor.white),
      ),
    );
  }
}