import 'dart:convert';

import 'package:flutter_pcnc/model/Product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController{
  var products=<Product>[];
  var isLoading=true;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
}
void fetchProducts() async{
  try{
    isLoading=true;
    update();
    var response=await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
    if(response.statusCode==200){
      var jsonData= json.decode(response.body) as List;
      products=jsonData.map((product)=> Product.fromJson(product)).toList();
  }
}catch(e){
  print("Error fetching Products: $e");
}finally{
  isLoading=false;
  update();
}
}
}