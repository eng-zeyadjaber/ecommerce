import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotHeader extends StatelessWidget {
  final String title;
  final String body;

  const ForgotHeader({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          title.tr,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          body.tr,
          style: const TextStyle(
            color: Colors.grey,
            height: 1.5,
          ),
        ),

      ],
    );
  }
}