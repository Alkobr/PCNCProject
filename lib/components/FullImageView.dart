import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullImageView extends StatelessWidget {
  final String imageUrl;

  const FullImageView({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
