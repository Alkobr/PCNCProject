import 'package:flutter/material.dart';
import 'package:flutter_pcnc/view/Home.dart';
import 'package:flutter_pcnc/view/LogIn.dart';
import 'package:flutter_pcnc/view/SearchOffAll.dart';
import 'package:flutter_pcnc/view/SearchPageCategory.dart';
import 'package:flutter_pcnc/view/SignUp.dart';
import 'package:flutter_pcnc/view/splashscreen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/LogIn',
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/LogIn',
          page: () =>   LogIn(),
        ),
        GetPage(name: "/SignUp", page:()=>Signup()),
        GetPage(name: "/SearchPageCategory", page: ()=>Searchpageany()),
        GetPage(name: "/SearchOffAll", page: ()=>Searchoffall()),
        GetPage(name: '/Home', page: ()=>Home())
      ],
    );
  }
}
