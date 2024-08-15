import 'package:flutter/material.dart';
import 'dart:async';

import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Get.toNamed(
          "/LogIn");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("images/4b0254f20afb0cc5bd6c26ed5925ee13.png"),
      ),
    );
  }
}
