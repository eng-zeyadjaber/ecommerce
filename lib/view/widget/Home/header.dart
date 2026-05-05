import 'package:ecommercecourse/controller/home_ctrl.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Image.asset(
                AppImageAsset.logo,
                height: 35,
                color: AppTextColor.primary,
              ),

              const SizedBox(width: 8),

              /// زر البحث
              if (!controller.isSearchOpen)
                InkWell(
                  onTap: controller.toggleSearch,
                  child: const Icon(Icons.search),
                ),

              const SizedBox(width: 10),

              /// خانة البحث
              Expanded(
                child: controller.isSearchOpen
                    ? Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          style: TextStyle(color: AppTextColor.black),
                          autofocus: true, // 🔥 هذا يغنيك عن FocusNode
                          decoration: InputDecoration(
                            hintText: "Search...",
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: controller.toggleSearch,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),

              // Builder(
              //   builder: (context) => InkWell(
              //     onTap: () {
              //       Scaffold.of(context).openDrawer(); // 🔥 يفتح الـ drawer
              //     },
              //     child: const Icon(Icons.menu),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
