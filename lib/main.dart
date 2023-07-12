import 'package:new_life/daily_quote.dart' as quote_utils;
import 'package:new_life/tools/styles.dart';
import 'package:new_life/widgetIsland.dart';
import 'package:flutter/material.dart';
import 'package:new_life/islands.dart';
import 'chain.dart' as chain_utils;
import 'formatted_date.dart';
import 'chain.dart';

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

              //todo 100 satır chain
              Island(
                themeColor: themeColor1,
                text: chainText,
                onLongPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Confirmation"),
                        content: Text("Are you sure you want to break the chain?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text("No"),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.of(context).pop(); // Close the dialog
                              String year = await getYear();
                              if (year != "null") {
                                await breakChain(); // Wait for breakChain() to complete before proceeding
                              }
                            },
                            child: Text("Yes"),
                          ),

                        ],
                      );
                    },
                  );
                },
                onPressed: () async {
                  String year = await getYear();
                  if (year == "null") {
                    setState(() {
                      editChain = !editChain;
                    });
                  }
                },
              ),


              /* Chain */
//todo şu widgetları taşıyabildiğin kadar dışarı taşi bide uygulamayı kapatıp tekrar açan bir fonksiyon bul oluyorsa chain üzerinden bir fonksiyon bul
              WidgetIsland(
                isVisible: editChain,
                themeColor: themeColor2,
                size: 2,
                widget: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          hintText:
                              "Her gün düzenli olarak yapmak istediğin ana hedefini gir.",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  Colors.black, // Set underline color to black
                            ),
                          ),
                        ),
                        cursorColor: Colors.black, // Set cursor color to black
                        onChanged: (value) {
                          enteredText = value;
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            if (enteredText.isNotEmpty) {
                              startChain();
                              print(enteredText);
                              editChain = false;
                            }
                          });
                        },
                        child:
                            Text("Veriyi Al ve Yazdır", style: buttonStyle()),
                      ),
                    ],
                  ),
                ),
              ),
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
