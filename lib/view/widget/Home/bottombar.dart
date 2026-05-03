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
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: AppTextColor.primary,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: [
        _item(Icons.shopping_bag, 0),
        _item(Icons.favorite, 1),
        _item(Icons.home, 2),
        _item(Icons.notifications, 3),
        _item(Icons.person, 4),
      ],
    );
  }

  BottomNavigationBarItem _item(IconData icon, int index) {
    bool isSelected = currentIndex == index;

    return BottomNavigationBarItem(
      label: "",
      icon: Transform.translate(
        offset: Offset(0, isSelected ? -10 : 0), // 🔥 الرفع
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: isSelected
              ? const BoxDecoration(color: Colors.blue, shape: BoxShape.circle)
              : null,
          child: Icon(icon),
        ),
      ),
    );
  }
}
