import 'package:flutter/material.dart';
import 'package:flutter_pcnc/model/Product.dart';
import 'package:get/get.dart';
import 'FullImageView.dart';
class SearchProductcard extends StatelessWidget {
  final Product product;

  const SearchProductcard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 200,
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
            child: Container(
              height: 150,
              width:200,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(product.images[0]),
                  fit: BoxFit.cover,
                ),
              ),
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
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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

