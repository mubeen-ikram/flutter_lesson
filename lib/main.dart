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

class Recipe {
  List<String> ingredients;
  int calories;
  double milligramsOfSodium;

// TODO: Create a const constructor here"
}

class _MyHomePageState extends State<MyHomePage> {
// Tests your solution (Don't edit!):
  void main() {
    final errs = <String>[];

    try {
      const obj = Recipe(['1 egg', 'Pat of butter', 'Pinch salt'], 120, 200);

      if (obj.ingredients.length != 3) {
        errs.add(
            'Called Recipe([\'1 egg\', \'Pat of butter\', \'Pinch salt\'], 120, 200) \n and got an object with ingredient list of length ${obj.ingredients.length} rather than the expected length (3).');
      }

      if (obj.calories != 120) {
        errs.add(
            'Called Recipe([\'1 egg\', \'Pat of butter\', \'Pinch salt\'], 120, 200) \n and got an object with a calorie value of ${obj.calories} rather than the expected value (120).');
      }

      if (obj.milligramsOfSodium != 200) {
        errs.add(
            'Called Recipe([\'1 egg\', \'Pat of butter\', \'Pinch salt\'], 120, 200) \n and got an object with a milligramsOfSodium value of ${obj.milligramsOfSodium} rather than the expected value (200).');
      }
    } catch (e) {
      print(
          'Tried calling Recipe([\'1 egg\', \'Pat of butter\', \'Pinch salt\'], 120, 200) \n and received a null.');
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
