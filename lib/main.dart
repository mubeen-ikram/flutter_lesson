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

  String? upperCaseIt(String? str) {
    // TODO: Try conditionally accessing the `toUpperCase` method here.
  }


  void main() {
    try {
      String? one = upperCaseIt(null);
      if (one != null) {
        print('Looks like you\'re not returning null for null inputs.');
      } else {
        print('Success when str is null!');
      }
    } catch (e) {
      print('Tried calling upperCaseIt(null) and got an exception: \n ${e.runtimeType}.');
    }

    try {
      String? two = upperCaseIt('a string');
      if (two == null) {
        print('Looks like you\'re returning null even when str has a value.');
      } else if (two != 'A STRING') {
        print('Tried upperCaseIt(\'a string\'), but didn\'t get \'A STRING\' in response.');
      } else {
        print('Success when str is not null!');
      }
    } catch (e) {
      print('Tried calling upperCaseIt(\'a string\') and got an exception: \n ${e.runtimeType}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    main();
    return const SizedBox();
  }
}
