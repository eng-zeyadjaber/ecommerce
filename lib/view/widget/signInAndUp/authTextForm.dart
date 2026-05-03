import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTextForm extends StatefulWidget {
  final String hint;
  final IconData icon;
  final bool obscure;

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const AuthTextForm({
    super.key,
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  State<AuthTextForm> createState() => _AuthTextFormState();
}

class _AuthTextFormState extends State<AuthTextForm> {

  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      validator: widget.validator,

      obscureText: widget.obscure ? isHidden : false,

      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white24,

        prefixIcon: Icon(widget.icon, color: Colors.white),

        /// 👁️ أيقونة العين
        suffixIcon: widget.obscure
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
                icon: Icon(
                  isHidden ? Icons.visibility_off : Icons.visibility,
                  color: isHidden
                      ? Colors.white70
                      : AppTextColor.primary, // 🔥 أزرق
                ),
              )
            : null,

        hintText: widget.hint.tr,
        hintStyle: const TextStyle(color: Colors.white70),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}