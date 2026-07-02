import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppTextColor.primary,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildItem(Icons.favorite, 0),
            _buildItem(Icons.home, 1),
            const SizedBox(width: 48),
            _buildItem(Icons.notifications, 3),
            _buildItem(Icons.person, 4),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(IconData icon, int index) {
    final isSelected = currentIndex == index;

    return IconButton(
      onPressed: () => onTap(index),
      icon: Icon(icon, color: isSelected ? Colors.white : Colors.white54),
    );
  }
}
