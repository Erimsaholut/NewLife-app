import 'package:new_life/functional_islands/daily_quote/daily_quote.dart'
as quote_utils;
import 'package:new_life/functional_islands/chain/chain_functions.dart';
import 'package:new_life/test/table_test.dart';
import 'package:new_life/tools/styles.dart';
import 'package:new_life/functional_islands/chain/widgetIsland.dart';
import 'package:flutter/material.dart';
import 'package:new_life/tools/islands.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'functional_islands/chain/chain.dart' as chain_utils;
import 'functional_islands/chain/chain.dart';
import 'functional_islands/showDate/formatted_date.dart';
import 'program_maker.dart';

void main() {
  runApp(const MyApp());
}

Color themeColor1 = const Color.fromARGB(255, 48, 227, 202);
Color themeColor2 = const Color.fromARGB(255, 17, 153, 158);
Color themeColor3 = const Color.fromARGB(255, 5, 191, 219);
Color themeColor4 = const Color.fromARGB(255, 228, 249, 245);
Color themeColor5 = const Color.fromARGB(255, 100, 204, 197);

String chainText = "";
String quoteText = "";
String mainTarget = "";
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
      home: const MyHomePage(title: 'New Life'),
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
    getMainTarget();
  }

  Future<void> getMainTarget() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? target = prefs.getString('mainTarget');
    setState(() {
      if (target != null){
        mainTarget = target;
        print("ana hedef"+ mainTarget);
      }else{
        mainTarget = " ";
        print("ana hedef"+ mainTarget);
      }

    });
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
      getMainTarget();
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
        title: Text(
          "New Life",
          style: titleStyle(),
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
                themeColor: themeColor2,
                isVisiable: (mainTarget != " "),
                text: '"$mainTarget" hedefine devam et !!',
              ),/*main Target*/
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
                themeColor: themeColor2,
                size: 2,
                text: quoteText,
              ),
              /*quote*/
              ProgramMaker(
                themeColor: themeColor1,
              ),
              /* Program oluşturma */
              Island(
                themeColor: themeColor5,
                text: "Table Test",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TableTest(),
                    ),
                  );
                },
              ),
              /*table Test*/
            ],
          ),
        ),
      ),
    );
  }
}
