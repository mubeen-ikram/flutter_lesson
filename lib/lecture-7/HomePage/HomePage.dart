import 'package:flutter/material.dart';
import 'package:project_example/lecture-7/MainState.dart';
import 'package:provider/provider.dart';

import '../ListItemView/ListItemView.dart';

class MyHomePageL7 extends StatelessWidget {
  const MyHomePageL7({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Consumer<AppState>(
              builder: (context, appState, child){
                var products = appState.getProductsList();
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    var currentItem = products[index];
                    return ListItemView( currentItem: currentItem,);
                  },
                  itemCount: products.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
