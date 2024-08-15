import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_pcnc/components/DrawerWidget.dart';
import 'package:flutter_pcnc/components/FullImageView.dart';
import 'package:flutter_pcnc/components/SearchProductCard.dart';
import 'package:flutter_pcnc/controller/CategoryController.dart';
import 'package:flutter_pcnc/controller/LogInController.dart';
import 'package:flutter_pcnc/controller/ProductController.dart';
import 'package:get/get.dart';

class Searchoffall extends StatefulWidget {
  @override
  _SearchoffallState createState() => _SearchoffallState();
}

class _SearchoffallState extends State<Searchoffall> {
  final Logincontroller logincontroller = Get.put(Logincontroller());
  final CategoryController categoryController = Get.put(CategoryController());
  final ProductController productcontroller = Get.put(ProductController());
  GlobalKey<ScaffoldState> scaffoldstate = GlobalKey();

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFDFDFD),
      key: scaffoldstate,
      drawer: DrawerWidget(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    scaffoldstate.currentState?.openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
                Container(
                  width: 310,
                  alignment: Alignment.center,
                  height: 50,
                  child: const Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffF2673B),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Form(
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 213, 213, 213),
                  ),
                  hintText: "Search anything",
                  hintStyle: TextStyle(color: Color(0xffBBBBBB)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: InputBorder.none,
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 250, 250),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: GetBuilder<CategoryController>(
                builder: (categoryController) {
                  return GetBuilder<ProductController>(
                    builder: (productController) {
                      if (categoryController.isLoading ||
                          productController.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        var filteredCategories = categoryController.categories
                            .where((category) => category.name
                                .toLowerCase()
                                .contains(searchQuery))
                            .toList();

                        var filteredProducts = productController.products
                            .where((product) =>
                                product.title
                                    .toLowerCase()
                                    .contains(searchQuery) ||
                                product.description
                                    .toLowerCase()
                                    .contains(searchQuery) ||
                                product.price.toString().contains(searchQuery))
                            .toList();

                        List<Widget> combinedList = [];

                        combinedList.addAll(filteredCategories.map((category) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => FullImageView(imageUrl: category.image));
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                color: const Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 200,
                                    height: 150,
                                    color: Colors.white,
                                    child: Image.network(
                                      category.image,
                                      width: 200,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    category.name,
                                    style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList());

                        combinedList.addAll(filteredProducts.map((product) {
                          return SearchProductcard(product: product);
                        }).toList());

                        combinedList.shuffle(Random());

                        if (combinedList.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                    "https://s3-alpha-sig.figma.com/img/bdc8/0035/c5d4c5765afd9aefc80e5064c4b32d01?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=gfy84J-QtWyZ4rbN8VzOfiu7PPUYQ3n459Y1LHEuYxU465OcQXVRA~NK7WC4loc6tFsCSEec0JzEdQdRRPgef9cBif5mUi~YQGZnVpcxjE45TWV0sisiLasUfQuyQ4ABOP38RjoWVg7nblHCwxeyc-ZcHmHeBZPZZYxESzg8WdbbXXXIx0y3q13qRXbrcxbrb7XblgiI45cF8xnSUZCfS28kTpY~1PxeMvqJ8GE88jurmkAK6ZOzZIfIZiBMrPHZ2sKGpWPIlW15Tq8ytE9UXZNroS3jLBXl7yMtSd5jkWQpyCTx5QOC~33trG5VKQBgpF8XRMPN2VjFMZWSpc8J3g__"),
                                const SizedBox(height: 10),
                                const Text(
                                  "Oops, we don't find any results!",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 70.0,
                              childAspectRatio: 1,
                            ),
                            itemCount: combinedList.length,
                            itemBuilder: (context, index) {
                              return combinedList[index];
                            },
                          );
                        }
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
