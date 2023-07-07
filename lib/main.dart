import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Life",
          style: TextStyle(),
        ),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children:[Container(
          height: 100,
          decoration: BoxDecoration(color: Colors.brown),
        ),
        SizedBox(height: 20),
        Container(
          height: 100,
          decoration: BoxDecoration(color: Colors.red),
        ),
        SizedBox(height: 20),
        Container(
          height: 100,
          decoration: BoxDecoration(color: Colors.grey),
        ),
        SizedBox(height: 20),
        Container(
          height: 100,
          decoration: BoxDecoration(color: Colors.brown),
        ),]
      ),
    );
  }
}
