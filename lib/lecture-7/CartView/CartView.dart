import 'package:flutter/material.dart';
import 'package:project_example/lecture-7/MainState.dart';
import 'package:provider/provider.dart';

import '../ListItemView/ListItemView.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppState>(
        builder: (context, state, child) {
          return Column(
            children: [
              if (child != null) child,
              if (state.likedProducts.isEmpty)
                const Text("No products Liked at the moment")
              else
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      var currentItem = state.likedProducts[index];
                      return ListItemView(
                        currentItem: currentItem,
                      );
                    },
                    itemCount: state.likedProducts.length,
                  ),
                ),
              if (child != null) child,
              if (state.likedProducts.isNotEmpty)
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                          "Total Price is : ${state.likedProducts.map((e) => e.price).reduce((value, element) => value + element)}"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () => state.clearAll(),
                              child: const Text("Order Now"))
                        ],
                      ),
                    ],
                  ),
                ),

            ],
          );
        },
        child: const Expanded(flex: 1, child: Text("This is my cart screen")),
      ),
    );
  }
}
