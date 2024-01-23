import 'package:flutter/material.dart';
import 'Model/Product.dart';
import 'package:project_example/Utils/SharedPrefernce.dart';

class History extends StatefulWidget {

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<bool> showHistoryList = [];
  Map<int, List<Product>> historyListFromSharedPreferences = {};

  @override
  void initState() {
    super.initState();
    loadHistoryList();
    showHistoryList = List.generate(historyListFromSharedPreferences.length, (index) => true);
  }
  void loadHistoryList() async {
    Map<int, List<Product>> savedHistoryList = await SharedPrefernce.getHistoryMap();
    setState(() {
      historyListFromSharedPreferences = savedHistoryList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: historyListFromSharedPreferences.length,
              itemBuilder: (BuildContext context, int index) {
                int key = historyListFromSharedPreferences.keys.elementAt(index);
                List<Product> productList = historyListFromSharedPreferences[key] ?? [];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showHistoryList[index] = !showHistoryList[index];
                            });
                          },
                          child: Text(
                            showHistoryList[index] ? "Hide History" : "Show History",
                          ),
                        ),
                      ],
                    ),
                    Text("Order Number: $key"),
                    for (Product product in productList)
                      Visibility(
                        visible: showHistoryList[index],
                        child: ListTile(
                          title: Text(product.name),
                          subtitle: Text("Price: ${product.price}"),
                        ),
                      ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
