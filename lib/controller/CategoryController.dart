import 'package:flutter_pcnc/model/Category.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryController extends GetxController {
  var categories = <Category>[];
  var isLoading = true;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  void fetchCategories() async {
    try {
      isLoading = true;
      update();
      var response = await http
          .get(Uri.parse('https://api.escuelajs.co/api/v1/categories'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        categories =
            data.map((category) => Category.fromJson(category)).toList();
      }
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      isLoading = false;
      update();
    }
  }
}
