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
  String joinWithCommas(int a, [int? b, int? c, int? d, int? e]) {
    return TODO();
  }

// Tests your solution (Don't edit!):
  void main() {
    final errs = <String>[];

    try {
      final value = joinWithCommas(1);

      if (value != '1') {
        errs.add(
            'Tried calling joinWithCommas(1) \n and got $value instead of the expected (\'1\').');
      }
    } on UnimplementedError {
      print(
          'Tried to call joinWithCommas but failed. \n Did you implement the method?');
      return;
    } catch (e) {
      print(
          'Tried calling joinWithCommas(1), \n but encountered an exception: ${e.runtimeType}.');
      return;
    }

    try {
      final value = joinWithCommas(1, 2, 3);

      if (value != '1,2,3') {
        errs.add(
            'Tried calling joinWithCommas(1, 2, 3) \n and got $value instead of the expected (\'1,2,3\').');
      }
    } on UnimplementedError {
      print(
          'Tried to call joinWithCommas but failed. \n Did you implement the method?');
      return;
    } catch (e) {
      print(
          'Tried calling joinWithCommas(1, 2 ,3), \n but encountered an exception: ${e.runtimeType}.');
      return;
    }

    try {
      final value = joinWithCommas(1, 2, 3, 4, 5);

      if (value != '1,2,3,4,5') {
        errs.add(
            'Tried calling joinWithCommas(1, 2, 3, 4, 5) \n and got $value instead of the expected (\'1,2,3,4,5\').');
      }
    } on UnimplementedError {
      print(
          'Tried to call joinWithCommas but failed. \n Did you implement the method?');
      return;
    } catch (e) {
      print(
          'Tried calling stringify(1, 2, 3, 4 ,5), \n but encountered an exception: ${e.runtimeType}.');
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
