import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../MainState.dart';
import '../Model/Product.dart';

class ListItemView extends StatelessWidget {
  const ListItemView({super.key, required this.currentItem});

  final ProductL7 currentItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Provider.of<AppState>(context, listen: false).toggleProductLike(currentItem);
            },
            child: ListTile(
              title: Text(
                currentItem.name,
              ),
              subtitle: Text("${currentItem.price}"),
              trailing: Consumer<AppState>(
                builder: (context, appState, child) {
                  return Icon(appState.likedProducts
                          .map((e) => e.id)
                          .contains(currentItem.id)
                      ? Icons.favorite
                      : Icons.favorite_outline);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
