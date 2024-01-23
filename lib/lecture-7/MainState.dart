import 'package:flutter/material.dart';

import 'Model/Product.dart';

class AppState extends ChangeNotifier{

  List<ProductL7> likedProducts = [];
  List<ProductL7> currentProducts = [];

  void toggleProductLike(ProductL7 product) {

      if (likedProducts.map((e) => e.id).contains(product.id)) {
        likedProducts.removeWhere((element) => element.id == product.id);
      } else {
        likedProducts.add(product);
      }
      notifyListeners();
  }

  void clearAll() {
      likedProducts.clear();
      notifyListeners();
  }

  List<ProductL7> getProductsList() {
    return List.generate(
        200,
            (i) =>
            ProductL7(id: i, name: "Name $i", price: (i + 100), isSelected: false));
  }

}