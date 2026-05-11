import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:ecommercecourse/controller/home_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        final bestProduct = controller.bestDiscountItem;
        if (bestProduct == null) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(child: Text('No product available')),
          );
        }

        final imageName = bestProduct['items_image']?.toString() ?? '';
        final title =
            bestProduct['items_ar_name']?.toString() ??
            bestProduct['items_name']?.toString() ??
            'Unknown Product';
        final discount = bestProduct['items_discount']?.toString() ?? '0';
        final priceValue = bestProduct['items_price']?.toString() ?? '';
        final price = priceValue.isNotEmpty ? '\$${priceValue}' : '';

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "shop_with_us".tr,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "get_discount_off".trParams({"discount": discount}),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Cairo",
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "shop_now".tr,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                child: Image.asset(
                  '${AppImageAsset.items}/$imageName',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
