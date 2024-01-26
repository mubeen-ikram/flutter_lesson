import 'package:flutter/material.dart';
import 'package:project_example/lecture-7/CartView/CartView.dart';

import '../../lecture-6/main.dart';
import '../HomePage/HomePage.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
   BuildContext? mcontext;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushReplacement(mcontext!, MaterialPageRoute(builder: (mcontext)=>CartView()));
    });
  }
  @override
  Widget build(BuildContext context) {
    mcontext=context;
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Image.network("https://cdn.vectorstock.com/i/1000x1000/32/69/lets-shopping-logo-design-template-shop-icon-vector-23363269.webp")
        ),
      ),
    );

  }
}

