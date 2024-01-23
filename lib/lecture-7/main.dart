import 'package:flutter/material.dart';
import 'package:project_example/lecture-7/MainState.dart';
import 'package:provider/provider.dart';

import 'CartView/CartView.dart';
import 'HomePage/HomePage.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=> AppState(),
      child: MaterialApp(
        title: 'Namer App',
        initialRoute: '/',
        routes: {
          '/cart': (context) => const CartView(),
          '/': (context) => const MyHomePageL7()
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
