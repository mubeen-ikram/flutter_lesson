import 'package:flutter/material.dart';

import 'Model/Product.dart';

class History extends StatefulWidget {
  final List<Product> historyList;

  const History({required this.historyList, Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.historyList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(widget.historyList[index].name),
          );
        },
      ),
    );
  }
}
