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

  void updateSomeVars() {
    // Substitute an operator that makes 'a string' be assigned to bar.
    bar /* TODO */ 'a string';
  }


// Tests your solution (Don't edit!):
  void main() {
    String? foo = 'a string';
    String? bar; // = null

    // Substitute an operator that makes 'a string' be assigned to baz.
        String? baz = foo /* TODO */  bar;


    try {
      updateSomeVars();

      if (foo != 'a string') {
        print('Looks like foo somehow ended up with the wrong value.');
      } else if (bar != 'a string') {
        print('Looks like bar ended up with the wrong value.');
      } else if (baz != 'a string') {
        print('Looks like baz ended up with the wrong value.');
      } else {
        print('Success!');
      }
    } catch (e) {
      print('Exception: ${e.runtimeType}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    main();
    return const SizedBox();
  }
}
