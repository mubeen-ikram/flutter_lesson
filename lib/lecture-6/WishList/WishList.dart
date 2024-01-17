import 'package:flutter/material.dart';
import '../Model/Product.dart';
class WishList extends StatefulWidget {
  const WishList(
      this.likedProducts,
      this.wishList,
      this.onProductToggle,
      this.onToggleWishlist,
      this.onClear,
      {this.historyList = const [], super.key}
      );

  final List<Product> likedProducts;
  final List<Product> wishList;
  final List<Product> historyList;
  final Function onProductToggle;
  final Function onToggleWishlist;
  final Function onClear;


  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (widget.wishList.isEmpty)
            const Text("No products in wishList at the moment")
          else
            Expanded(
              flex: 4,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  var currentItem = widget.wishList[index];
                  return ListWishItemView(
                    currentItem: currentItem,
                    onProductToggle: widget.onToggleWishlist,
                    wishList: widget.wishList,
                  );
                },
                itemCount: widget.wishList.length,
              ),
            ),
          ElevatedButton(
            onPressed: () {
              widget.onClear();
            },
            child: const Text("Clear Wishlist"),
          ),
        ],
      ),
    );
  }
}

class ListWishItemView extends StatelessWidget {
  const ListWishItemView({
    super.key,
    required this.currentItem,
    required this.onProductToggle,
    required this.wishList,
  });

  final Product currentItem;
  final Function onProductToggle;
  final List<Product> wishList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              onProductToggle(currentItem);
            },
            title: Text(
              currentItem.name,
            ),
            subtitle: Text("${currentItem.price}"),
            trailing: Icon(
              Icons.favorite, // Consider using Icons.favorite for wishlist
              color: wishList.map((e) => e.id).contains(currentItem.id)
                  ? Colors.red
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
