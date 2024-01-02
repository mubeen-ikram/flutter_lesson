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
  // Assign this a list containing 'a', 'b', and 'c' in that order:
  final aListOfStrings = null;

// Assign this a set containing 3, 4, and 5:
  final aSetOfInts = null;

// Assign this a map of String to int so that aMapOfStringsToInts['myKey'] returns 12:
  final aMapOfStringsToInts = null;

// Assign this an empty List<double>:
  final anEmptyListOfDouble = null;

// Assign this an empty Set<String>:
  final anEmptySetOfString = null;

// Assign this an empty Map of double to int:
  final anEmptyMapOfDoublesToInts = null;


// Tests your solution (Don't edit!):
  void main() {
    final errs = <String>[];

    if (aListOfStrings is! List<String>) {
      errs.add('aListOfStrings should have the type List<String>.');
    } else if (aListOfStrings.length != 3) {
      errs.add('aListOfStrings has ${aListOfStrings.length} items in it, \n rather than the expected 3.');
    } else if (aListOfStrings[0] != 'a' || aListOfStrings[1] != 'b' || aListOfStrings[2] != 'c') {
      errs.add('aListOfStrings doesn\'t contain the correct values (\'a\', \'b\', \'c\').');
    }

    if (aSetOfInts is! Set<int>) {
      errs.add('aSetOfInts should have the type Set<int>.');
    } else if (aSetOfInts.length != 3) {
      errs.add('aSetOfInts has ${aSetOfInts.length} items in it, \n rather than the expected 3.');
    } else if (!aSetOfInts.contains(3) || !aSetOfInts.contains(4) || !aSetOfInts.contains(5)) {
      errs.add('aSetOfInts doesn\'t contain the correct values (3, 4, 5).');
    }

    if (aMapOfStringsToInts is! Map<String, int>) {
      errs.add('aMapOfStringsToInts should have the type Map<String, int>.');
    } else if (aMapOfStringsToInts['myKey'] != 12) {
      errs.add('aMapOfStringsToInts doesn\'t contain the correct values (\'myKey\': 12).');
    }

    if (anEmptyListOfDouble is! List<double>) {
      errs.add('anEmptyListOfDouble should have the type List<double>.');
    } else if (anEmptyListOfDouble.isNotEmpty) {
      errs.add('anEmptyListOfDouble should be empty.');
    }

    if (anEmptySetOfString is! Set<String>) {
      errs.add('anEmptySetOfString should have the type Set<String>.');
    } else if (anEmptySetOfString.isNotEmpty) {
      errs.add('anEmptySetOfString should be empty.');
    }

    if (anEmptyMapOfDoublesToInts is! Map<double, int>) {
      errs.add('anEmptyMapOfDoublesToInts should have the type Map<double, int>.');
    } else if (anEmptyMapOfDoublesToInts.isNotEmpty) {
      errs.add('anEmptyMapOfDoublesToInts should be empty.');
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
