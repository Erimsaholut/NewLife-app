import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

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

  String quote = datas[todaysNumber - 1]["quote"] + "\n\n-";

  if (datas[todaysNumber - 1]["owner"] != "Unknown") {
    quote += datas[todaysNumber - 1]["owner"];
  }
  return quote;
}