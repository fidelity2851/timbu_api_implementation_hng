import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timbu_api_implementation_hng/models/product.dart';
import 'package:http/http.dart' as http;

class ProductController {
  List _products = [];

  ProductController();

  getProducts() {
    return _products;
  }

  Future<List<Product>> fetchProducts() async {
    const url =
        'https://api.timbu.cloud/products?organization_id=328f3079aa0a41d69ebf6b45fd0a0963&Appid=0V4LP27NSFRQSS3&Apikey=ad798766142f4427ae0ae31ab757929f20240705135733718036';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body)['items'];

      final result =
          json.map((productJson) => Product.fromJson(productJson)).toList();
      return result;
    } else {
      throw Exception('Failed to load products');
    }
  }
}

final productProvider = FutureProvider<List<Product>>((ref) {
  return ProductController().fetchProducts();
});
