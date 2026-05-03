import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotInput extends StatefulWidget {
  final Function(String)? onChanged;
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  /// 🔥 نحدد هل هذا حقل باسوورد
  final bool isPassword;

  const ForgotInput({
    super.key,
    required this.hint,
    this.controller,
    this.onChanged,
    this.validator,
    this.isPassword = false,
  });

  @override
  State<ForgotInput> createState() => _ForgotInputState();
}

class _ForgotInputState extends State<ForgotInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      onChanged: widget.onChanged,

      obscureText: widget.isPassword ? isHidden : false,

      style: const TextStyle(color: AppTextColor.black),

      decoration: InputDecoration(
        hintText: widget.hint.tr,

        hintStyle: const TextStyle(color: AppTextColor.grey),

        filled: true,
        fillColor: AppTextColor.fieldBackground,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),

        /// 👁️ العين
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
                icon: Icon(
                  isHidden ? Icons.visibility_off : Icons.visibility,
                  color: isHidden ? AppTextColor.grey : AppTextColor.primary,
                ),
              )
            : null,
      ),
    );
  }
}
