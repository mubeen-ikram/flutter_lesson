import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        initialRoute: '/',
        routes: {
          '/second': (context) =>
              BigCard(currentText: WordPair("second", "Screen")),
          '/fourth': (context) =>
              BigCard3(currentText: WordPair("fourth", "Screen")),
          '/third': (context) =>
              BigCard2(currentText: WordPair("third", "Screen")),
          '/': (context) => const MyHomePage(),
        },
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        // home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  var favourites = <WordPair>[];

  void nextPair() {
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavourite() {
    if (checkFavourite()) {
      favourites.remove(current);
    } else {
      favourites.add(current);
    }
    notifyListeners();
  }

  bool checkFavourite() {
    return favourites.contains(current);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.pushNamed(context, "/second");
    if (result is WordPair) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('$result')));
    } else if (result is TodoClass) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text('text: ${result.text},Done:  ${result.isDone}')));
    } else if (result == null) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
            SnackBar(content: Text('Please select an options from there')));
    } else {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('Error occured')));
    }
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var currentText = appState.current;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(currentText: currentText),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _navigateAndDisplaySelection(context);
                      // Navigator.pushNamed(context, "/second");
                      print("Like Button clicked");
                    },
                    child: Row(
                      children: [
                        Icon(appState.checkFavourite()
                            ? Icons.favorite
                            : Icons.favorite_outline),
                        Text("Like"),
                      ],
                    )),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () => appState.nextPair(), child: Text("Next")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TodoClass {
  const TodoClass({
    required this.text,
    required this.isDone,
  });

  final String text;
  final bool isDone;
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.currentText,
  });

  final WordPair currentText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return GestureDetector(
      onTap: () {
        // if (Navigator.canPop(context)) {
        Navigator.pushNamed(context, "/third");
        // }
      },
      child: Card(
        color: theme.colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text(currentText.asLowerCase, style: style)),
        ),
      ),
    );
  }
}

class BigCard2 extends StatelessWidget {
  const BigCard2({
    super.key,
    required this.currentText,
  });

  final WordPair currentText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return GestureDetector(
      onTap: () {
        // if (Navigator.canPop(context)) {

        Navigator.pushNamed(context, "/fourth");
        // }
      },
      child: Card(
        color: theme.colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text(currentText.asLowerCase, style: style)),
        ),
      ),
    );
  }
}

class BigCard3 extends StatelessWidget {
  const BigCard3({
    super.key,
    required this.currentText,
  });

  final WordPair currentText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return GestureDetector(
      onTap: () {
        // if (Navigator.canPop(context)) {
        Navigator.popUntil(context, ModalRoute.withName('/second'));
        // }
      },
      child: Card(
        color: theme.colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text(currentText.asLowerCase, style: style)),
        ),
      ),
    );
  }
}
