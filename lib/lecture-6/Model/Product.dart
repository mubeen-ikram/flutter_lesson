import 'package:flutter/foundation.dart';

class Product extends ChangeNotifier {
  Product({required this.id,
    required this.name,
    required this.price});

  final int id;
  final String name;
  final int price;

  Product.fromJson(Map<String, dynamic> json)
      : id = json['i'],
        name = json['n'],
        price = json['p'];

  Map<String, dynamic> toJson() {
    return {
      'i': id,
      'n': name,
      'p': price,
    };
  }

}


List<Product> getProductsList() {
  return List.generate(
      200,
          (i) =>
          Product(id: i, name: "Name $i", price: (i + 100)));
}
