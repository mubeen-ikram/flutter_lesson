import 'package:flutter/material.dart';

import '../CartView/CartView.dart';
import '../Model/Product.dart';

class MyHomePageL6 extends StatefulWidget {
  const MyHomePageL6(this.likedProducts, this.onProductToggle, {super.key});

  final List<Product> likedProducts;
  final Function onProductToggle;

  @override
  State<MyHomePageL6> createState() => _MyHomePageL6State();
}

class _MyHomePageL6State extends State<MyHomePageL6> {
  @override
  Widget build(BuildContext context) {
    var products = getProductsList();
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      drawer: Drawer(
        child: Column(children: [
          ListTile(
            title: GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/cart"),
              child: const Text("My Cart"),
            ),
          )
        ]),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                var currentItem = products[index];
                return ListItemView( currentItem: currentItem, onProductToggle: widget.onProductToggle,likedProducts: widget.likedProducts, );
              },
              itemCount: products.length,
            ),
          )
        ],
      ),
    );
  }
}
