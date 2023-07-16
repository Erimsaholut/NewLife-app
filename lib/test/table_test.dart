import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TableTest extends StatefulWidget {
  const TableTest({Key? key}) : super(key: key);

  @override
  _TableTestState createState() => _TableTestState();
}

class _TableTestState extends State<TableTest> {
  List<Widget> myList = [];
  List<String> myTargets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    myTargets = prefs.getStringList('targets') ?? [];
    addRows();
  }

  void addRows() {
    for (int i = 0; i < myTargets.length; i++) {
      myList.add(
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(myTargets[i]),
          ),
        ),
      );
    }
    setState(() {}); // Notify the widget to rebuild with the new data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TableTest"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Table(
              border: TableBorder.all(color: Colors.white30),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.redAccent),
                  children: myList.isNotEmpty ? myList : _getEmptyRow(),
                ),
                ...List.generate(
                  30,
                      (index) => TableRow(
                    children: myList.isNotEmpty ? myList : _getEmptyRow(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _getEmptyRow() {
    return [
      const TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: SizedBox.shrink(),
      ),
    ];
  }
}
