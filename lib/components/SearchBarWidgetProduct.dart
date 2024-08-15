import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onTap: () {
          Get.toNamed("/SearchOffAll");
        },
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Color.fromARGB(255, 213, 213, 213),
          ),
          hintText: "Search any Product",
          hintStyle: TextStyle(color: Color(0xffBBBBBB)),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: InputBorder.none,
          filled: true,
          fillColor: Color.fromARGB(255, 255, 250, 250),
        ),
      ),
    );
  }
}
