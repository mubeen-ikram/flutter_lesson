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
class MyDataObject {
  final int anInt;
  final String aString;
  final double aDouble;

  MyDataObject({
    this.anInt = 1,
    this.aString = 'Old!',
    this.aDouble = 2.0,
  });

// TODO: Add your copyWith method here:
}

class _MyHomePageState extends State<MyHomePage> {


// Tests your solution (Don't edit!):
  void main() {
  final source = MyDataObject();
  final errs = <String>[];

  try {
  final copy = source.copyWith(newInt: 12, newString: 'New!', newDouble: 3.0);

  if (copy.anInt != 12) {
  errs.add('Called copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0), \n and the new object\'s anInt was ${copy.anInt} rather than the expected value (12).');
  }

  if (copy.aString != 'New!') {
  errs.add('Called copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0), \n and the new object\'s aString was ${copy.aString} rather than the expected value (\'New!\').');
  }

  if (copy.aDouble != 3) {
  errs.add('Called copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0), \n and the new object\'s aDouble was ${copy.aDouble} rather than the expected value (3).');
  }
  } catch (e) {
  print('Called copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0) \n and got an exception: ${e.runtimeType}');
  }

  try {
  final copy = source.copyWith();

  if (copy.anInt != 1) {
  errs.add('Called copyWith(), and the new object\'s anInt was ${copy.anInt} \n rather than the expected value (1).');
  }

  if (copy.aString != 'Old!') {
  errs.add('Called copyWith(), and the new object\'s aString was ${copy.aString} \n rather than the expected value (\'Old!\').');
  }

  if (copy.aDouble != 2) {
  errs.add('Called copyWith(), and the new object\'s aDouble was ${copy.aDouble} \n rather than the expected value (2).');
  }
  } catch (e) {
  print('Called copyWith() and got an exception: ${e.runtimeType}');
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
