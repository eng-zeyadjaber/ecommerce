import 'package:ecommercecourse/controller/home_ctrl.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/view/widget/Home/banner.dart';
import 'package:ecommercecourse/view/widget/Home/bottombar.dart';
import 'package:ecommercecourse/view/widget/Home/categories.dart';
import 'package:ecommercecourse/view/widget/Home/drawer.dart';
import 'package:ecommercecourse/view/widget/Home/header.dart';
import 'package:ecommercecourse/view/widget/Home/products.dart';
import 'package:ecommercecourse/view/widget/Home/titlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return Scaffold(
          endDrawer: SizedBox(width: 200, child: const CustomDrawer()),
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: controller.currentIndex, // 🔥 مهم
            onTap: controller.changePage, // 🔥 مهم
          ),
          backgroundColor: Colors.grey[100],
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                /// 🔥 الهيدر الثابت
                SliverAppBar(
                  pinned: false, // ✅ يخليه ثابت
                  automaticallyImplyLeading: false,
                  floating: false,
                  snap: false,
                  elevation: 0,
                  backgroundColor: Colors.grey[100],

                  title: const HomeHeader(),
                ),

                /// 🔥 المحتوى
                SliverToBoxAdapter(
                  child: HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Column(
                      children: [
                        const BannerWidget(),
                        const Titlehome(title: 'categories'),
                        const CategoriesWidget(),
                        const Titlehome(title: 'product_for_you'),
                        const ProductsWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
