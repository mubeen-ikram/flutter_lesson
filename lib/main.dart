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

typedef VoidFunction = void Function();

class MyLogger extends Logger {
  Type? lastType;
  String lastMessage = '';
  bool done = false;

  void logException(Type t, [String? message]) {
    lastType = t;
    lastMessage = message ?? lastMessage;
  }

  void doneLogging() => done = true;
}

class ExceptionWithMessage {
  final String message;

  const ExceptionWithMessage(this.message);
}

// Call logException to log an exception, and doneLogging when finished.
abstract class Logger {
  void logException(Type t, [String? msg]);

  void doneLogging();
}

class _MyHomePageState extends State<MyHomePage> {
  void tryFunction(VoidFunction untrustworthy, Logger logger) {
    // Invoking this method might cause an exception.
    // TODO: Catch and handle them using try-on-catch-finally.
    untrustworthy();
  }

// Tests your solution (Don't edit!):

  void main() {
    final errs = <String>[];
    var logger = MyLogger();

    try {
      tryFunction(() => throw Exception(), logger);

      if ('${logger.lastType}' != 'Exception' &&
          '${logger.lastType}' != '_Exception') {
        errs.add(
            'Untrustworthy threw an Exception, but a different type was logged: \n ${logger.lastType}.');
      }

      if (logger.lastMessage != '') {
        errs.add(
            'Untrustworthy threw an Exception with no message, but a message \n was logged anyway: \'${logger.lastMessage}\'.');
      }

      if (!logger.done) {
        errs.add(
            'Untrustworthy threw an Exception, \n and doneLogging() wasn\'t called afterward.');
      }
    } catch (e) {
      print(
          'Untrustworthy threw an exception, and an exception of type \n ${e.runtimeType} was unhandled by tryFunction.');
    }

    logger = MyLogger();

    try {
      tryFunction(() => throw ExceptionWithMessage('Hey!'), logger);

      if (logger.lastType != ExceptionWithMessage) {
        errs.add(
            'Untrustworthy threw an ExceptionWithMessage(\'Hey!\'), but a \n different type was logged: ${logger.lastType}.');
      }

      if (logger.lastMessage != 'Hey!') {
        errs.add(
            'Untrustworthy threw an ExceptionWithMessage(\'Hey!\'), but a \n different message was logged: \'${logger.lastMessage}\'.');
      }

      if (!logger.done) {
        errs.add(
            'Untrustworthy threw an ExceptionWithMessage(\'Hey!\'), \n and doneLogging() wasn\'t called afterward.');
      }
    } catch (e) {
      print(
          'Untrustworthy threw an ExceptionWithMessage(\'Hey!\'), \n and an exception of type ${e.runtimeType} was unhandled by tryFunction.');
    }

    logger = MyLogger();
    bool caughtStringException = false;

    try {
      tryFunction(() => throw 'A String', logger);
    } on String {
      caughtStringException = true;
    }

    if (!caughtStringException) {
      errs.add(
          'Untrustworthy threw a string, and it was incorrectly handled inside tryFunction().');
    }

    logger = MyLogger();

    try {
      tryFunction(() {}, logger);

      if (logger.lastType != null) {
        errs.add(
            'Untrustworthy didn\'t throw an Exception, \n but one was logged anyway: ${logger.lastType}.');
      }

      if (logger.lastMessage != '') {
        errs.add(
            'Untrustworthy didn\'t throw an Exception with no message, \n but a message was logged anyway: \'${logger.lastMessage}\'.');
      }

      if (!logger.done) {
        errs.add(
            'Untrustworthy didn\'t throw an Exception, \n but doneLogging() wasn\'t called afterward.');
      }
    } catch (e) {
      print(
          'Untrustworthy didn\'t throw an exception, \n but an exception of type ${e.runtimeType} was unhandled by tryFunction anyway.');
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
