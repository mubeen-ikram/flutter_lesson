import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// TODO: Declare the two variables here


// Tests your solution (Don't edit!):
  void nullSafety() {
    try {
      if (name == 'Jane' && address == null) {
        // verify that "name" is nullable
        name = null;
        print('Success!');
      } else {
        print('Not quite right, try again!');
      }
    } catch (e) {
      print('Exception: ${e.runtimeType}');
    }
  }
  @override
  Widget build(BuildContext context) {
    nullSafety();
    return const SizedBox();
  }
}
