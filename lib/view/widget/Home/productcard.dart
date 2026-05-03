import 'package:ecommercecourse/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(AppImageAsset.productTest),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite_border),
                ),
              ),

              Positioned(
                bottom: -20,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.shopping_bag, color: Colors.white),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),

        const Text("Bomber Jackets"),
        const SizedBox(height: 5),
        const Text("\$49.99", style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
