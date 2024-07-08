import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timbu_api_implementation_hng/models/product.dart';
import 'package:http/http.dart' as http;

class ProductController {
  final String orgId = '328f3079aa0a41d69ebf6b45fd0a0963';
  final String appId = '0V4LP27NSFRQSS3';
  final String apiKey = 'ad798766142f4427ae0ae31ab757929f20240705135733718036';

  ProductController();

  Future<List<Product>> fetchProducts() async {
    final url =
        'https://api.timbu.cloud/products?organization_id=$orgId&Appid=$appId&Apikey=$apiKey';
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
