import 'package:shared_preferences/shared_preferences.dart';

Future<String> chain() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final int? year = prefs.getInt('dateTimeYear');
  final int? month = prefs.getInt('dateTimeMonth');
  final int? day = prefs.getInt('dateTimeDay');

  if (year == null) {
    return "Şu anda zinciriniz yok. Lütfen bir tane oluşturmak için basın. Ana hedefinizi değiştirmezsiniz. Sayacı sıfırlamak için uzun basınız.";
  } else {
    DateTime startingDate = DateTime(year!, month!, day!);
    DateTime today = DateTime.now();

    int daysPast = today.difference(startingDate).inDays+1;

    return "Zinciri $daysPast gündür kırmadınız.";
  }
}

Future<void> startChain() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt("dateTimeYear", DateTime.now().year);
  await prefs.setInt("dateTimeMonth", DateTime.now().month);
  await prefs.setInt("dateTimeDay", DateTime.now().day);
}

Future<void> breakChain() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('dateTimeYear');
  await prefs.remove('dateTimeMonth');
  await prefs.remove('dateTimeDay');
}
