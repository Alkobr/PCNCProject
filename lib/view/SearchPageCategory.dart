import 'package:flutter/material.dart';
import 'package:flutter_pcnc/controller/CategoryController.dart';
import 'package:flutter_pcnc/controller/LogInController.dart';
import 'package:flutter_pcnc/controller/ProductController.dart';
import 'package:get/get.dart';

class Searchpageany extends StatefulWidget {
  @override
  _SearchpageanyState createState() => _SearchpageanyState();
}

class _SearchpageanyState extends State<Searchpageany> {
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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {
                  Get.offAllNamed("/Home");
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Logout'),
                onTap: () {
                  logincontroller.logout();
                  Get.offAllNamed("/LogIn");
                },
              ),
            ],
          ),
        ),
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
                      "Categories",
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
                    hintText: "Search any Category",
                    hintStyle: TextStyle(color: Color(0xffBBBBBB)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: InputBorder.none,
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 250, 250)),
              )),
              const SizedBox(height: 50),
              Expanded(
                child: GetBuilder<CategoryController>(builder: (controller) {
                  if (controller.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    var filteredCategories =
                        controller.categories.where((category) {
                      return category.name.toLowerCase().contains(searchQuery);
                    }).toList();

                    if (filteredCategories.isEmpty) {
                      return Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Image.network(
                                "https://s3-alpha-sig.figma.com/img/bdc8/0035/c5d4c5765afd9aefc80e5064c4b32d01?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=gfy84J-QtWyZ4rbN8VzOfiu7PPUYQ3n459Y1LHEuYxU465OcQXVRA~NK7WC4loc6tFsCSEec0JzEdQdRRPgef9cBif5mUi~YQGZnVpcxjE45TWV0sisiLasUfQuyQ4ABOP38RjoWVg7nblHCwxeyc-ZcHmHeBZPZZYxESzg8WdbbXXXIx0y3q13qRXbrcxbrb7XblgiI45cF8xnSUZCfS28kTpY~1PxeMvqJ8GE88jurmkAK6ZOzZIfIZiBMrPHZ2sKGpWPIlW15Tq8ytE9UXZNroS3jLBXl7yMtSd5jkWQpyCTx5QOC~33trG5VKQBgpF8XRMPN2VjFMZWSpc8J3g__"),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Oops, we don't find any results!",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ]));
                    } else {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, 
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 50.0,
                          childAspectRatio: 1,
                        ),
                        itemCount: filteredCategories.length,
                        itemBuilder: (context, index) {
                          var category = filteredCategories[index];
                          return Container(
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
                                  color: Colors.black
                                      .withOpacity(0.1),
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
                                  width: double.infinity,
                                  height: 150,
                                  color: Colors.white,
                                  child: Image.network(
                                    category.image,
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
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }
                }),
              ),
            ],
          ),
        ));
  }
}
