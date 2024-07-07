import 'package:timbu_api_implementation_hng/models/product.dart';

class ProductController {
  final List<Map<String, dynamic>> _products = [
    {'name': 'Fidelis'}
  ];

  ProductController();

  getProducts() {
    return _products;
  }

  Future<List> fetchProducts() async {
    return [];
  }
}
