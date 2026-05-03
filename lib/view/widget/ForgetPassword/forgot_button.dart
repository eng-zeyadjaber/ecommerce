import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class ForgotButton extends StatelessWidget {

  final String text;
  final VoidCallback? onPressed;

  const ForgotButton({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {

    final bool disabled = onPressed == null;

    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          backgroundColor: disabled
              ? AppTextColor.grey
              : AppTextColor.primary,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        onPressed: onPressed,

        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: "Cairo",
            color: AppTextColor.white,
          ),
        ),
      ),
    );
  }
}
