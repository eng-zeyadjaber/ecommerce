import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthLinks extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color; // لون اختياري

  const AuthLinks({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text.tr,
        style: TextStyle(
          fontSize: 12,
          color: color ?? AppTextColor.body, // اللون الافتراضي
        ),
      ),
    );
  }
}