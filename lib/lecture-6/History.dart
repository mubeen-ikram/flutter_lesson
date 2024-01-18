import 'package:flutter/material.dart';

import 'Model/Product.dart';

class History extends StatefulWidget {
  final Map<int, List<Product>> historyList;

  const History({required this.historyList, Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  bool showHistory = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Visibility(
              visible: showHistory,
              child: ListView.builder(
                itemCount: widget.historyList.length,
                itemBuilder: (BuildContext context, int index) {
                  int key = widget.historyList.keys.elementAt(index);
                  List<Product> productList = widget.historyList[key] ?? [];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order Number: $key"),
                      for (Product product in productList)
                        ListTile(
                          title: Text(product.name),
                          subtitle: Text("Price: ${product.price}"),
                        ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                showHistory = !showHistory;
              });
            },
            child: Text(showHistory ? "Hide History" : "Show History"),
          ),
        ],
      ),
    );
  }
}
