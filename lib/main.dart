import 'package:new_life/daily_quote.dart' as quote_utils;
import 'package:new_life/chain_functions.dart';
import 'package:new_life/widgetIsland.dart';
import 'package:flutter/material.dart';
import 'package:new_life/islands.dart';
import 'chain.dart' as chain_utils;
import 'chain.dart';
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
String enteredText = "";
bool editChain = false;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
    String quote = await quote_utils.dailyQuote();
    setState(() {
      chainText = chain;
      quoteText = quote;
    });
  }

  void updateEditChain(bool newEditChain) {
    setState(() {
      editChain = newEditChain;
    });
  }

  void toggleEditChain() async {
    String year = await getYear();
    if (year == "null") {
      setState(() {
        editChain = !editChain;
      });
    }
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
              ),
              /*Tarih*/

              Island(
                themeColor: themeColor1,
                text: chainText,
                onLongPressed: () => setAlertButton(context),
                onPressed: toggleEditChain,
              ),
              /* Chain */

              WidgetIsland(
                isVisible: editChain,
                themeColor: themeColor2,
                size: 2,
                onEditChainChanged: updateEditChain,
              ),
              /*hedef girme widgetı*/

              Island(
                themeColor: themeColor3,
                size: 2,
              ),
              Island(themeColor: themeColor1),
              Island(
                themeColor: themeColor2,
                size: 2,
                text: quoteText,
              ),
              /*quote*/

              Island(themeColor: themeColor3),
            ],
          ),
        ),
      ),
    );
  }
}
