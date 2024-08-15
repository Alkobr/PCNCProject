import 'package:flutter/material.dart';
import 'package:flutter_pcnc/components/FullImageView.dart';
import 'package:get/get.dart';
import 'package:flutter_pcnc/model/Product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => FullImageView(imageUrl: product.images[0]));
            },
            child: Image.network(
              product.images[0],
              fit: BoxFit.cover,
              width: 200,
              height: 150,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              product.title,
              style: const TextStyle(
                fontFamily: "Montserrat",
                fontSize: 16,
                color: Colors.black,
              ),
              overflow: TextOverflow.visible,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "${product.price}\$",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_outline),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_checkout),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


