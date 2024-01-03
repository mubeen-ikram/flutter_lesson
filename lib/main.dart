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
  final int anInt;
  final String aString;
  final double aDouble;

// TODO: Create the constructor here.
}

class _MyHomePageState extends State<MyHomePage> {


// Tests your solution (Don't edit!):
  void main() {
  final errs = <String>[];

  try {
  final obj = MyClass(1, 'two', 3);

  if (obj.anInt != 1) {
  errs.add('Called MyClass(1, \'two\', 3) and got an object with anInt of ${obj.anInt} \n instead of the expected value (1).');
  }

  if (obj.anInt != 1) {
  errs.add('Called MyClass(1, \'two\', 3) and got an object with aString of \'${obj.aString}\' \n instead of the expected value (\'two\').');
  }

  if (obj.anInt != 1) {
  errs.add('Called MyClass(1, \'two\', 3) and got an object with aDouble of ${obj.aDouble} \n instead of the expected value (3).');
  }
  } catch (e) {
  print('Called MyClass(1, \'two\', 3) and got an exception \n of type ${e.runtimeType}.');
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
