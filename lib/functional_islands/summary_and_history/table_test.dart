import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../../tools/styles.dart';

class TableTest extends StatefulWidget {
  const TableTest({Key? key}) : super(key: key);

  @override
  _TableTestState createState() => _TableTestState();
}

class _TableTestState extends State<TableTest> {
  List<Widget> myList = [];
  List<String> myTargets = [];
  late DateTime weekStartDate = DateTime.now();
  late DateTime weekEndDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    loadData();
    setWeekDates();
  }

  Future<void> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myTargets = prefs.getStringList('targets') ?? [];
    });
  }

  void setWeekDates() {
    DateTime today = DateTime.now();
    int weekday = today.weekday;
    weekStartDate = today.subtract(Duration(days: weekday - 1));
    weekEndDate = today.add(Duration(days: 7 - weekday));
  }

  @override
  Widget build(BuildContext context) {
    if (weekStartDate == null || weekEndDate == null) {
      return Container(); // Return an empty container or a loading indicator until the dates are initialized
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("TableTest"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                '${DateFormat('dd.MM.yyyy').format(weekStartDate)} - ${DateFormat('dd.MM.yyyy').format(weekEndDate)}',
                style:  quoteStyleSmall(),
              ),
              const SizedBox(height: 10.0),
              Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(67.0),
                },
                children: [
                  TableRow(
                    children: List.generate(
                      8,
                          (colIndex) => TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            colIndex == 0
                                ? ''
                                : ['Pzt', 'Sal', 'Çrş', 'Prş', 'Cum', 'Cts', 'Pzr'][(colIndex - 1) % 7],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ...List.generate(
                    myTargets.length,
                        (rowIndex) => TableRow(
                      children: List.generate(
                        8,
                            (colIndex) => TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              colIndex == 0 ? myTargets[rowIndex] : '',
                              style: quoteStyleSmall(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
