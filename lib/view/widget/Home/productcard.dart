import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

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
                    image: AssetImage(image),
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

        Text(title),
        const SizedBox(height: 5),
        Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
