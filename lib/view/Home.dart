import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pcnc/components/CategoryWidget.dart';
import 'package:flutter_pcnc/components/DrawerWidget.dart';
import 'package:flutter_pcnc/components/ProductCard.dart';
import 'package:flutter_pcnc/components/ProductCardwithout.dart';
import 'package:flutter_pcnc/components/SearchBarWidgetProduct.dart';
import 'package:flutter_pcnc/components/TopBarWidget.dart';
import 'package:flutter_pcnc/controller/CategoryController.dart';
import 'package:flutter_pcnc/controller/LogInController.dart';
import 'package:flutter_pcnc/controller/ProductController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Logincontroller logincontroller = Get.put(Logincontroller());
  final CategoryController categoryController = Get.put(CategoryController());
  final ProductController productcontroller = Get.put(ProductController());
  GlobalKey<ScaffoldState> scaffoldstate = GlobalKey();
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldstate,
      backgroundColor: const Color(0xffFDFDFD),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        currentIndex: selectedItem,
        onTap: (value) {
          setState(() {
            selectedItem = value;
          });
          if (value == 3) {
            Get.toNamed("/SearchOffAll");
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: "Wishlist"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: "Settings"),
        ],
      ),
      drawer: DrawerWidget(),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            TopBarWidget(scaffoldKey: scaffoldstate),
            const SizedBox(
              height: 20,
            ),
            SearchBarWidget(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "All Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(15),
                    color: const Color(0xffFFFFFF),
                    onPressed: () {
                      Get.toNamed("/SearchPageCategory");
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(fontSize: 16),
                    )),
              ],
            ),
            CategoryWidget(),
            GetBuilder<ProductController>(builder: (controller) {
              if (controller.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: 320,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          var product = controller.products[index];
                          return ProductCard(product: product);
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 320,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          var product = controller.products[index];
                          return ProductCard(product: product);
                        },
                      ),
                    ),
                  ],
                );
              }
            }),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 200,
              height: 100,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Color(0xffF2673A)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding:
                          const EdgeInsets.only(left: 30, top: 20, bottom: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: const Text(
                              "Trending Products",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: "Montserrat"),
                            )),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Last Date 29/02/22",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontFamily: "Montserrat"),
                                )
                              ],
                            )
                          ])),
                  Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: MaterialButton(
                        padding: const EdgeInsets.all(20),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              "View all",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontFamily: "Montserrat"),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<ProductController>(builder: (controller) {
              if (controller.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          var product = controller.products[index];
                          return ProductCardwithout(
                              product: product); // Use the reusable widget
                        },
                      ),
                    ),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
