import 'package:flutter/material.dart';
import '../CartView/CartView.dart';
import '../Model/Product.dart';
import '../WishList/WishList.dart';

class MyHomePageL6 extends StatefulWidget {
  const MyHomePageL6({
    this.likedProducts = const [],
    this.wishList = const [],
    required this.onProductToggle,
    required this.onProductWishToggle,
    Key? key,
  }) : super(key: key);

  final List<Product> likedProducts;
  final List<Product> wishList;
  final Function onProductToggle;
  final Function onProductWishToggle;

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
          ),
          ListTile(
            title: GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/wishlist"),
              child: const Text("WishList"),
            ),
          ),
          ListTile(
            title: GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/history"),
              child: const Text("History"),
            ),
          ),
        ]),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                var currentItem = products[index];
                return ListItemView(
                  currentItem: currentItem,
                  onProductToggle: widget.onProductToggle,
                  likedProducts: widget.likedProducts,
                  wishList: widget.wishList,
                  onProductWishToggle: widget.onProductWishToggle, // Pass the correct function or data
                );
              },
              itemCount: products.length,
            ),
          ),
        ],
      ),
    );
  }
}
