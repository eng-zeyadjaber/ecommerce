import 'package:ecommercecourse/controller/home_ctrl.dart';
import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              /// 🔥 الرابط
              String imageName =
                  controller.categories[index]['categories_image'];
              print(imageName); // 👈 هنا بالضبط

              return Container(
                //
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 80,
                child: Column(
                  children: [
                    /// 🔥 صورة الكاتيجوري
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "${AppImageAsset.categories}/$imageName",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),
                    Text(
                      controller.categories[index]['categories_name'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: "Cairo",
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
