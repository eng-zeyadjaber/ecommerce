import 'package:flutter/material.dart';

class OnBoardingIndicator extends StatelessWidget {
  final int currentPage;
  final int length;

  const OnBoardingIndicator({
    super.key,
    required this.currentPage,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentPage == index ? 20 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: currentPage == index ? Colors.white : Colors.white54,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
