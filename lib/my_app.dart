import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.flavor});
  final String? flavor;

  @override
  Widget build(BuildContext context) {   
    return MaterialApp(
      theme: _getThemeForFlavor(),
      home: MyHomePage(flavor: flavor ?? 'Flutter Demo'),
    );
  }
  ThemeData _getThemeForFlavor() {
    switch (flavor) {
      case 'dev':
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        );
      case 'qa':
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        );
      case 'prod':
      default:
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        );
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.flavor});
  final String flavor;

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
        title: Text(widget.flavor),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Base URL: ${_getApiUrl(widget.flavor)}'),
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

  String _getApiUrl(String flavor) {
    switch (flavor) {
      case 'dev':
        return 'https://dev-api.example.com';
      case 'qa':
        return 'https://qa-api.example.com';
      case 'prod':
        return 'https://api.example.com';
      default:
        return 'https://dev-api.example.com';
    }
  }
}
