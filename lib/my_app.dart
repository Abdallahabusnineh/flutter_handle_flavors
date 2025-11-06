import 'package:flutter/material.dart';

// # -----------------------------------------
// # DEV FLAVOR — DEBUG MODE
// # -----------------------------------------
// # Runs the app using main_dev.dart in debug mode.
// flutter run --flavor dev -t lib/main_dev.dart --debug

// # -----------------------------------------
// # DEV FLAVOR — RELEASE MODE
// # -----------------------------------------
// # Runs the app using main_dev.dart in release mode (optimized build).
// flutter run --flavor dev -t lib/main_dev.dart --release

// # -----------------------------------------
// # DEV FLAVOR — BUILD APK (DEBUG)
// # -----------------------------------------
// # Builds a debug APK for dev flavor.
// flutter build apk --flavor dev -t lib/main_dev.dart --debug

// # -----------------------------------------
// # DEV FLAVOR — BUILD APK (RELEASE)
// # -----------------------------------------
// # Builds a release APK for dev flavor.
// flutter build apk --flavor dev -t lib/main_dev.dart --release

// # -----------------------------------------
// # DEV FLAVOR — BUILD APPBUNDLE (RELEASE)
// # -----------------------------------------
// # Required for Play Store upload.
// flutter build appbundle --flavor dev -t lib/main_dev.dart --release

// # =========================================
// # PROD FLAVOR
// # =========================================

// # -----------------------------------------
// # PROD FLAVOR — DEBUG MODE
// # -----------------------------------------
// flutter run --flavor prod -t lib/main_prod.dart --debug

// # -----------------------------------------
// # PROD FLAVOR — RELEASE MODE
// # -----------------------------------------
// flutter run --flavor prod -t lib/main_prod.dart --release

// # -----------------------------------------
// # PROD FLAVOR — BUILD APK (DEBUG)
// # -----------------------------------------
// flutter build apk --flavor prod -t lib/main_prod.dart --debug

// # -----------------------------------------
// # PROD FLAVOR — BUILD APK (RELEASE)
// # -----------------------------------------
// flutter build apk --flavor prod -t lib/main_prod.dart --release

// # -----------------------------------------
// # PROD FLAVOR — BUILD APPBUNDLE (RELEASE)
// # -----------------------------------------
// flutter build appbundle --flavor prod -t lib/main_prod.dart --release

// # =========================================
// # QA FLAVOR
// # =========================================

// # -----------------------------------------
// # QA FLAVOR — DEBUG MODE
// # -----------------------------------------
// flutter run --flavor qa -t lib/main_qa.dart --debug

// # -----------------------------------------
// # QA FLAVOR — RELEASE MODE
// # -----------------------------------------
// flutter run --flavor qa -t lib/main_qa.dart --release

// # -----------------------------------------
// # QA FLAVOR — BUILD APK (DEBUG)
// # -----------------------------------------
// flutter build apk --flavor qa -t lib/main_qa.dart --debug

// # -----------------------------------------
// # QA FLAVOR — BUILD APK (RELEASE)
// # -----------------------------------------
// flutter build apk --flavor qa -t lib/main_qa.dart --release

// # -----------------------------------------
// # QA FLAVOR — BUILD APPBUNDLE (RELEASE)
// # -----------------------------------------
// flutter build appbundle --flavor qa -t lib/main_qa.dart --release

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.flavor});
  final String? flavor;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(title: flavor ?? 'Flutter Demo'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
