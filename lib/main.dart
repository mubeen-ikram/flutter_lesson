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

class BigObject {
  int anInt = 0;
  String aString = '';
  List<double> aList = [];
  bool _done = false;

  void allDone() {
    _done = true;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  BigObject fillBigObject(BigObject obj) {
    // Create a single statement that will update and return obj:
    return TODO('obj..');
  }

// Tests your solution (Don't edit!):
  void main() {
    BigObject obj;

    try {
      obj = fillBigObject(BigObject());
    } catch (e) {
      print(
          'Caught an exception of type ${e.runtimeType} \n while running fillBigObject');
      return;
    }

    final errs = <String>[];

    if (obj.anInt != 1) {
      errs.add(
          'The value of anInt was ${obj.anInt} \n rather than the expected (1).');
    }

    if (obj.aString != 'String!') {
      errs.add(
          'The value of aString was \'${obj.aString}\' \n rather than the expected (\'String!\').');
    }

    if (obj.aList.length != 1) {
      errs.add(
          'The length of aList was ${obj.aList.length} \n rather than the expected value (1).');
    } else {
      if (obj.aList[0] != 3.0) {
        errs.add(
            'The value found in aList was ${obj.aList[0]} \n rather than the expected (3.0).');
      }
    }

    if (!obj._done) {
      errs.add('It looks like allDone() wasn\'t called.');
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
