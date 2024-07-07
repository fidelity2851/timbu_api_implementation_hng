class Product {
  String uid;
  String name;
  String? desciption;
  double stock;
  double price;
  List<String> images;

  Product({
    required this.uid,
    required this.name,
    this.desciption,
    required this.stock,
    required this.price,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      uid: json['id'],
      name: json['name'],
      desciption: json['description'],
      stock: json['available_quantity'],
      price: json['current_price'][0]['NGN'][0],
      images: (json['photos'] as List)
          .map((photo) => photo['url'] as String)
          .toList(),
    );
  }
}
