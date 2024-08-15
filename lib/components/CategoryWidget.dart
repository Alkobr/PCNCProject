import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pcnc/controller/CategoryController.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (controller) {
      if (controller.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              var category = controller.categories[index];
              return Container(
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          category.image,
                          fit: BoxFit.cover,
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 70,
                      child: Text(
                        category.name,
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }
    });
  }
}
