import 'dart:convert';

import 'package:api_request_shop/src/model/productModel.dart';
import 'package:api_request_shop/src/repo/productRepo.dart';

class ProductController{
  final productRepo = ProductRepo();
  Future<List<Product>>getProduct() async{
    final response = await productRepo.getProduct();
    final data = jsonDecode(response.body);
    List<Product> products = [];
    final productsJson = data['products'];

    for(dynamic productJson in productsJson){
      products.add(Product.fromJson(productJson));
    }
    return products;
  }
}