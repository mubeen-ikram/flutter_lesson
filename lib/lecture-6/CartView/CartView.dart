import 'package:flutter/material.dart';
import 'package:project_example/lecture-6/Model/Product.dart';

class CartView extends StatefulWidget {
  const CartView(this.likedProducts, this.onProductToggle, this.onClear,
      {super.key});

  final List<Product> likedProducts;
  final Function onProductToggle;
  final Function onClear;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
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
                    likedProducts: widget.likedProducts,
                  );
                },
                itemCount: widget.likedProducts.length,
              ),
            ),
          if (!widget.likedProducts.isEmpty)
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                      "Total Price is : ${widget.likedProducts.map((e) => e.price).reduce((value, element) => value + element)}"),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () => widget.onClear(),
                          child: Text("Cart"))
                    ],
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}

class ListItemView extends StatelessWidget {
  const ListItemView({
    super.key,
    required this.currentItem,
    required this.onProductToggle,
    required this.likedProducts,
  });

  final Product currentItem;
  final Function onProductToggle;
  final List<Product> likedProducts;

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
              trailing: Icon(
                  likedProducts.map((e) => e.id).contains(currentItem.id)
                      ? Icons.favorite
                      : Icons.favorite_outline),
            ),
          ),
        ),
      ),
    );
  }
}
