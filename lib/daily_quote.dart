import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;
import 'package:new_life/islands.dart';

String quotePath = "assets/quotes/daily_quotes.json";

int todaysNumber = DateTime.now().day;
List<dynamic> datas = [];


Future<String> dailyQuote() async {

  try {
    String jsonData = await rootBundle.loadString(quotePath);
    Map<String, dynamic> data = json.decode(jsonData);
    datas = data['daily_quotes'];
  } catch (e) {
    print("JSON yükleme hatası: $e");
  }

  String quote = datas[todaysNumber - 1]["quote"];

  if (datas[todaysNumber - 1]["owner"] != "Unknown") {
    quote +=  "\n\n-";
    quote += datas[todaysNumber - 1]["owner"];
  }
  return quote;
}

class Chain extends StatefulWidget {
  const Chain({super.key});

  @override
  State<Chain> createState() => _ChainState();
}

class _ChainState extends State<Chain>{
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
