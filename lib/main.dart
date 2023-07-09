import 'package:flutter/material.dart';
import 'package:new_life/daily_quote.dart'as quote_utils;
import 'package:new_life/islands.dart';
import 'chain.dart' as chain_utils;
import 'formatted_date.dart';

void main() {
  runApp(const MyApp());
}

Color themeColor1 = const Color.fromARGB(255, 48, 227, 202);
Color themeColor2 = const Color.fromARGB(255, 17, 153, 158);
Color themeColor3 = const Color.fromARGB(255, 64, 81, 78);
Color themeColor4 = const Color.fromARGB(255, 228, 249, 245);

String chainText = "";
String quoteText = "";

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
  const MyHomePage({super.key,required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    initializeChain();
  }

  void initializeChain() async {
    String chain = await chain_utils.chain();
    String quote = await quote_utils.dailyQuote();// chain fonksiyonunu çağırarak zincirin durumunu alıyoruz
    setState(() {
      chainText = chain;
      quoteText = quote;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Life",
          style: TextStyle(),
        ),
        backgroundColor: themeColor2,
      ),
      body: Container(
        color: themeColor4,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Island(
                themeColor: themeColor2,
                text: formattedDate(),
              ), // Tarih
              Island(
                themeColor: themeColor1,
                text: chainText, // chainText değişkenini kullanarak zincirin durumunu gösteriyoruz
              ),
              Island(themeColor: themeColor3,size: 2,),
              Island(themeColor: themeColor1),
              Island(
                themeColor: themeColor2,
                size: 2,
                text: quoteText,
              ),
              Island(themeColor: themeColor3),
            ],
          ),
        ),
      ),
    );
  }
}
