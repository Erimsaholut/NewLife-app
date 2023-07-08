String formattedDate() {
  DateTime now = DateTime.now();
  String formattedDate = '${now.day} ${_getMonthName(now.month)}, ${_getDayNameInTurkish(now.weekday)}';
  return formattedDate;
}

String _getMonthName(int month) {
  List<String> monthNames = [
    'Ocak',
    'Şubat',
    'Mart',
    'Nisan',
    'Mayıs',
    'Haziran',
    'Temmuz',
    'Ağustos',
    'Eylül',
    'Ekim',
    'Kasım',
    'Aralık'
  ];
  return monthNames[month - 1];
}

String _getDayNameInTurkish(int dayOfWeek) {
  List<String> dayNames = [
    'Pazartesi',
    'Salı',
    'Çarşamba',
    'Perşembe',
    'Cuma',
    'Cumartesi',
    'Pazar'
  ];
  return dayNames[dayOfWeek - 1];
}
