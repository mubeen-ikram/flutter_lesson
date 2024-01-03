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

class IntegerHolder {
  IntegerHolder();

  // Implement this factory constructor.
  factory IntegerHolder.fromList(List<int> list) {
    TODO();
  }
}

class IntegerSingle extends IntegerHolder {
  final int a;

  IntegerSingle(this.a);
}

class IntegerDouble extends IntegerHolder {
  final int a;
  final int b;

  IntegerDouble(this.a, this.b);
}

class IntegerTriple extends IntegerHolder {
  final int a;
  final int b;
  final int c;

  IntegerTriple(this.a, this.b, this.c);
}

class _MyHomePageState extends State<MyHomePage> {
// Tests your solution (Don't edit!):
  void main() {
    final errs = <String>[];

    bool _throwed = false;
    try {
      IntegerHolder.fromList([]);
    } on UnimplementedError {
      print('Test failed. Did you implement the method?');
      return;
    } on Error {
      _throwed = true;
    } catch (e) {
      print(
          'Called IntegerSingle.fromList([]) and got an exception of \n type ${e.runtimeType}.');
      return;
    }

    if (!_throwed) {
      errs.add('Called IntegerSingle.fromList([]) and didn\'t throw Error.');
    }

    try {
      final obj = IntegerHolder.fromList([1]);

      if (obj is! IntegerSingle) {
        errs.add(
            'Called IntegerHolder.fromList([1]) and got an object of type \n ${obj.runtimeType} instead of IntegerSingle.');
      } else {
        if (obj.a != 1) {
          errs.add(
              'Called IntegerHolder.fromList([1]) and got an IntegerSingle with \n  an \'a\' value of ${obj.a} instead of the expected (1).');
        }
      }
    } catch (e) {
      print(
          'Called IntegerHolder.fromList([]) and got an exception of \n type ${e.runtimeType}.');
      return;
    }

    try {
      final obj = IntegerHolder.fromList([1, 2]);

      if (obj is! IntegerDouble) {
        errs.add(
            'Called IntegerHolder.fromList([1, 2]) and got an object of type \n ${obj.runtimeType} instead of IntegerDouble.');
      } else {
        if (obj.a != 1) {
          errs.add(
              'Called IntegerHolder.fromList([1, 2]) and got an IntegerDouble \n with an \'a\' value of ${obj.a} instead of the expected (1).');
        }

        if (obj.b != 2) {
          errs.add(
              'Called IntegerHolder.fromList([1, 2]) and got an IntegerDouble \n with an \'b\' value of ${obj.b} instead of the expected (2).');
        }
      }
    } catch (e) {
      print(
          'Called IntegerHolder.fromList([1, 2]) and got an exception \n of type ${e.runtimeType}.');
      return;
    }

    try {
      final obj = IntegerHolder.fromList([1, 2, 3]);

      if (obj is! IntegerTriple) {
        errs.add(
            'Called IntegerHolder.fromList([1, 2, 3]) and got an object of type \n ${obj.runtimeType} instead of IntegerTriple.');
      } else {
        if (obj.a != 1) {
          errs.add(
              'Called IntegerHolder.fromList([1, 2, 3]) and got an IntegerTriple \n with an \'a\' value of ${obj.a} instead of the expected (1).');
        }

        if (obj.b != 2) {
          errs.add(
              'Called IntegerHolder.fromList([1, 2, 3]) and got an IntegerTriple \n with an \'a\' value of ${obj.b} instead of the expected (2).');
        }

        if (obj.c != 3) {
          errs.add(
              'Called IntegerHolder.fromList([1, 2, 3]) and got an IntegerTriple \n with an \'a\' value of ${obj.b} instead of the expected (2).');
        }
      }
    } catch (e) {
      print(
          'Called IntegerHolder.fromList([1, 2, 3]) and got an exception \n of type ${e.runtimeType}.');
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
