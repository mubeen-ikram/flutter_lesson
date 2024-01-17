import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:project_example/lecture-6/Model/Product.dart';

import '../History.dart';

class CartView extends StatefulWidget {
  const CartView(
      this.likedProducts,
      this.wishList,
      this.onProductToggle,
      this.onProductWishToggle,
      this.onClear,
      {this.historyList = const [], Key? key}
      ) : super(key: key);



  final List<Product> likedProducts;
  final List<Product> wishList;
  final List<Product> historyList;
  final Function onProductToggle;
  final Function onProductWishToggle;
  final Function onClear;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  void placeOrder(BuildContext context) {
    print("Before navigating: ${widget.likedProducts.length}");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => History(historyList: widget.likedProducts),
      ),
    );
    widget.onClear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (widget.likedProducts.isEmpty)
            const Text("No products Liked at the moment")
          else
            Expanded(
              flex: 4,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  var currentItem = widget.likedProducts[index];
                  return ListItemView(
                    currentItem: currentItem,
                    onProductToggle: widget.onProductToggle,
                    onProductWishToggle: widget.onProductWishToggle, // Corrected parameter name
                    likedProducts: widget.likedProducts,
                    wishList: widget.wishList,
                  );
                },
                itemCount: widget.likedProducts.length,
              ),
            ),
          if (widget.likedProducts.isNotEmpty)
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    "Total Price is : ${widget.likedProducts.map((e) => e.price).reduce((value, element) => value + element)}",
                  ),
                  Center(
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () => placeOrder(context),
                          child: const Text("Order Now"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

}

class ListItemView extends StatelessWidget {
  const ListItemView({
    Key? key,
    required this.currentItem,
    required this.onProductToggle,
    required this.onProductWishToggle,
    required this.likedProducts,
    required this.wishList,
  }) : super(key: key);

  final Product currentItem;
  final Function onProductToggle;
  final Function onProductWishToggle;
  final List<Product> likedProducts;
  final List<Product> wishList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              onProductToggle(currentItem);
            },
            child: ListTile(
              title: Text(
                currentItem.name,
              ),
              subtitle: Text("${currentItem.price}"),
              trailing: SizedBox(
                width: 120,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        likedProducts.contains(currentItem)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                      ),
                      onPressed: () {
                        onProductToggle(currentItem);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        wishList.contains(currentItem)
                            ? Icons.shopping_cart_checkout
                            : Icons.shopping_cart,
                      ),
                      onPressed: () {
                        onProductWishToggle(currentItem);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
