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

class Color {
  int red;
  int green;
  int blue;

  Color(this.red, this.green, this.blue);

// TODO: Create a named constructor called "black" here
// and redirect it to call the existing constructor
}

class _MyHomePageState extends State<MyHomePage> {
// Tests your solution (Don't edit!):
  void main() {
    final errs = <String>[];

    try {
      final result = Color.black();

      if (result.red != 0) {
        errs.add(
            'Called Color.black() and got a Color with red equal to \n ${result.red} instead of the expected value (0).');
      }

      if (result.green != 0) {
        errs.add(
            'Called Color.black() and got a Color with green equal to \n ${result.green} instead of the expected value (0).');
      }

      if (result.blue != 0) {
        errs.add(
            'Called Color.black() and got a Color with blue equal to \n ${result.blue} instead of the expected value (0).');
      }
    } catch (e) {
      print(
          'Called Color.black() and got an exception of type ${e.runtimeType}.');
      return;
    }

    if (errs.isEmpty) {
      print('Success!');
    } else {
      errs.forEach(print);
    }
  }

  @override
  Widget build(BuildContext context) {
    main();
    return const SizedBox();
  }
}
