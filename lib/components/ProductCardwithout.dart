
import 'package:flutter/material.dart';
import 'package:flutter_pcnc/components/FullImageView.dart';
import 'package:flutter_pcnc/model/Product.dart';
import 'package:get/get.dart';

class ProductCardwithout extends StatelessWidget {
  final Product product;

  const ProductCardwithout({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 200,
      height: 350,
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
              width: double.infinity,
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
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
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
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

