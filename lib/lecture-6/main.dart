import 'package:flutter/material.dart';
import 'package:project_example/lecture-6/History.dart';
import 'package:project_example/lecture-6/WishList/WishList.dart';
import 'package:provider/provider.dart';
import 'CartView/CartView.dart';
import 'HomePage/HomePage.dart';
import 'Model/Product.dart';
import 'package:project_example/Utils/SharedPrefernce.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Product> likedProducts = [];
  List<Product> wishList = [];
  Map<int,List<Product>> historyList={};

  void toggleProductLike(Product product) {
    setState(() {
      if (likedProducts.map((e) => e.id).contains(product.id)) {
        likedProducts.removeWhere((element) => element.id == product.id);
      } else {
        likedProducts.add(product);
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }
  void toggleWishProduct(Product product) {
    setState(() {
      if (wishList.map((e) => e.id).contains(product.id)) {
        wishList.removeWhere((element) => element.id == product.id);
      } else {
        wishList.add(product);
      }
    });
  }

  void clearAll() {
    setState(() {
      historyList[DateTime.now().millisecondsSinceEpoch] = likedProducts.toList();
      SharedPrefernce.saveHistoryMap(historyList);

      likedProducts.clear();
      wishList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namer App',
      initialRoute: '/',
      routes: {
        '/cart': (context) => CartView(
            likedProducts,
            wishList,
            (Product product) => toggleProductLike(product),
                (Product product) => toggleWishProduct(product),
                () => clearAll()
        ),
        '/wishlist': (context) => WishList(
            likedProducts,
            wishList,
                (Product product) => toggleProductLike(product),
            (Product product) => toggleWishProduct(product),
                () => clearAll()
        ),
        '/history': (context) => History(),
        '/': (context) => MyHomePageL6(
          likedProducts: likedProducts,
          wishList: wishList,
          onProductToggle: (Product product) => toggleProductLike(product), onProductWishToggle: (Product product) => toggleWishProduct(product),
        ),
      },
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      // home: MyHomePage(),
    );
  }




}


// TODO: WishList Screen and item update
// TODO: Order History
// TODO: Add Hide/Show in order History
