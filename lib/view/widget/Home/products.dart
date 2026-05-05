import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:ecommercecourse/controller/home_ctrl.dart';
import 'package:ecommercecourse/view/widget/Home/productcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return SizedBox(
          height: 230,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.items.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final product = controller.items[index];
              final imageName = product['items_image']?.toString() ?? '';
              final title =
                  product['items_ar_name']?.toString() ??
                  product['items_name']?.toString() ??
                  '';
              final priceValue = product['items_price']?.toString() ?? '';
              final price = priceValue.isNotEmpty ? '\$${priceValue}' : '';

              return SizedBox(
                width: 150,
                child: ProductCard(
                  image: '${AppImageAsset.items}/$imageName',
                  title: title,
                  price: price,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
