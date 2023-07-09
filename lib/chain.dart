import 'package:shared_preferences/shared_preferences.dart';


Future<String> chain() async{

final SharedPreferences prefs = await SharedPreferences.getInstance();
// await prefs.setInt("dateTimeYear", 2022);
// await prefs.setInt("dateTimeMonth", 4);
// await prefs.setInt("dateTimeDay", 25);

  await prefs.remove('dateTimeYear');
  await prefs.remove('dateTimeMonth');
  await prefs.remove('dateTimeDay');

final int? year = prefs.getInt('dateTimeYear');
final int? month = prefs.getInt('dateTimeMonth');
final int? day = prefs.getInt('dateTimeDay');

  if (year == null) {
    return "Şu anda zinciriniz yok. Lütfen bir tane oluşturmak için basın.";
  } else {
    DateTime startingDate = DateTime(year!,month!,day!);
    DateTime bugun = DateTime.now();

    int daysPast = bugun.difference(startingDate).inDays;

    return "Zinciri $daysPast gündür kırmadınız.";
  }
}

