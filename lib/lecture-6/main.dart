import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CartView/CartView.dart';
import 'HomePage/HomePage.dart';
import 'Model/Product.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Product> likedProducts = [];

  void toggleProductLike(Product product) {
    setState(() {
      if (likedProducts.map((e) => e.id).contains(product.id)) {
        likedProducts.removeWhere((element) => element.id == product.id);
      } else {
        likedProducts.add(product);
      }
    });
  }

  void clearAll() {
    setState(() {
      likedProducts.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: MaterialApp(
        title: 'Namer App',
        initialRoute: '/',
        routes: {
          '/cart': (context) => CartView(
              likedProducts,
              (Product product) => toggleProductLike(product),
              () => clearAll()),
          '/': (context) => MyHomePageL6(
              likedProducts, (Product product) => toggleProductLike(product)),
        },
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        // home: MyHomePage(),
      ),
    );
  }
}

// TODO: WishList Screen and item update
// TODO: Order History
// TODO: Add Hide/Show in order History
