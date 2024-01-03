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
class FirstTwoLetters {
  final String letterOne;
  final String letterTwo;

  // TODO: Create a constructor with an initializer list here:
  FirstTwoLetters(String word)

}

class _MyHomePageState extends State<MyHomePage> {


// Tests your solution (Don't edit!):
  void main() {
  final errs = <String>[];

  try {
  final result = FirstTwoLetters('My String');

  if (result.letterOne != 'M') {
  errs.add('Called FirstTwoLetters(\'My String\') and got an object with \n letterOne equal to \'${result.letterOne}\' instead of the expected value (\'M\').');
  }

  if (result.letterTwo != 'y') {
  errs.add('Called FirstTwoLetters(\'My String\') and got an object with \n letterTwo equal to \'${result.letterTwo}\' instead of the expected value (\'y\').');
  }
  } catch (e) {
  errs.add('Called FirstTwoLetters(\'My String\') and got an exception \n of type ${e.runtimeType}.');
  }

  bool caughtException = false;

  try {
  FirstTwoLetters('');
  } catch (e) {
  caughtException = true;
  }

  if (!caughtException) {
  errs.add('Called FirstTwoLetters(\'\') and didn\'t get an exception \n from the failed assertion.');
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
