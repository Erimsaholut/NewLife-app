import 'package:shared_preferences/shared_preferences.dart';

Future<String> chain() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final int? year = prefs.getInt('dateTimeYear');
  final int? month = prefs.getInt('dateTimeMonth');
  final int? day = prefs.getInt('dateTimeDay');

  if (year == null) {
    return "Şu anda zinciriniz yok. Lütfen bir tane oluşturmak için basın. Ana hedefinizi değiştirmezsiniz. Sayacı sıfırlamak için uzun basınız.";
  } else {
    DateTime startingDate =
        DateTime(year, month!, day!); // Removed unnecessary null check
    DateTime today = DateTime.now();

    int daysPast = today.difference(startingDate).inDays;

    return "Zinciri $daysPast gündür kırmadınız.";
  }
}

Future<String> getYear() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getInt('dateTimeYear') == null) {
    return "null";
  } else {
    return "notNull";
  }
}

//todo bunlar setStatelenebilir mi ki
Future<void> startChain() async {
  print("başlatıldı");
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt("dateTimeYear", DateTime.now().year);
  await prefs.setInt("dateTimeMonth", DateTime.now().month);
  await prefs.setInt("dateTimeDay", DateTime.now().day);
}

Future<void> breakChain() async {
  print("Kırldı");
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('dateTimeYear');
  await prefs.remove('dateTimeMonth');
  await prefs.remove('dateTimeDay');
}
