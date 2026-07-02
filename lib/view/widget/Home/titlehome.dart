import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class Titlehome extends StatelessWidget {
  final String title;
  const Titlehome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      alignment: Alignment.centerRight,
      child: Text(
        title.tr,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
