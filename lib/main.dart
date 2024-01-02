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

class MyClass {
  int value1 = 2;
  int value2 = 3;
  int value3 = 5;

  // Returns the product of the above values:
  int get product => TODO();

  // Adds 1 to value1:
  void incrementValue1() => TODO();

  // Returns a string containing each item in the
  // list, separated by commas (e.g. 'a,b,c'):
  String joinWithCommas(List<String> strings) => TODO();
}

class _MyHomePageState extends State<MyHomePage> {
// Tests your solution (Don't edit!):
  void main() {
    final obj = MyClass();
    final errs = <String>[];

    try {
      final product = obj.product;

      if (product != 30) {
        errs.add(
            'The product property returned $product \n instead of the expected value (30).');
      }
    } catch (e) {
      print(
          'Tried to use MyClass.product, but encountered an exception: \n ${e.runtimeType}.');
      return;
    }

    try {
      obj.incrementValue1();

      if (obj.value1 != 3) {
        errs.add(
            'After calling incrementValue, value1 was ${obj.value1} \n instead of the expected value (3).');
      }
    } catch (e) {
      print(
          'Tried to use MyClass.incrementValue1, but encountered an exception: \n ${e.runtimeType}.');
      return;
    }

    try {
      final joined = obj.joinWithCommas(['one', 'two', 'three']);

      if (joined != 'one,two,three') {
        errs.add(
            'Tried calling joinWithCommas([\'one\', \'two\', \'three\']) \n and received $joined instead of the expected value (\'one,two,three\').');
      }
    } catch (e) {
      print(
          'Tried to use MyClass.joinWithCommas, but encountered an exception: \n ${e.runtimeType}.');
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
