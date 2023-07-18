import 'package:shared_preferences/shared_preferences.dart';
import 'package:new_life/tools/styles.dart';
import 'package:flutter/material.dart';

class ProgramMaker extends StatefulWidget {
  final Color themeColor;
  final int programSize;
  final VoidCallback? onLongPressed;

  const ProgramMaker({
    Key? key,
    required this.themeColor,
    this.onLongPressed,
    this.programSize = 1,
  }) : super(key: key);

  @override
  _ProgramMakerState createState() => _ProgramMakerState();
}

class _ProgramMakerState extends State<ProgramMaker> {
  double programSize = 1;
  String programText = "Programa hedef eklemek için basınız.";
  bool showEntry = false;
  String testString = "";
  List<String> targets = [];

  @override
  void initState() {
    super.initState();
    getList();
  }

  void programPressed() {
    setState(() {
      print(targets);

      showEntry = !showEntry;
      programSize = showEntry ? 2 : 1;
    });
  }

  Future<void> getList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    targets = prefs.getStringList('targets') ?? [];
  }

  Future<void> setList(String newTarget) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    targets.add(newTarget);
    await prefs.setStringList('targets', targets);
  }

  Future<void> resetList() async {
    print('reset');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('targets', []);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 100 * programSize,
          decoration: BoxDecoration(
            color: widget.themeColor,
            borderRadius: const BorderRadius.all(Radius.circular(32.0)),
          ),
          child: TextButton(
            onPressed: programPressed,
            onLongPress: resetList,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  programText,
                  style: quoteStyle(),
                ),
                Visibility(
                  visible: showEntry,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText:
                              "Lütfen ${targets.length + 1}. hedefinizi yazınız:",
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  Colors.black, // Set underline color to black
                            ),
                          ),
                        ),
                        cursorColor: Colors.black,
                        onChanged: (value) {
                          testString = value;
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          if (testString.isNotEmpty) {
                            setState(() {
                              print(testString);
                              setList(testString);
                            });
                          }
                        },
                        child: Text("Programa ekle", style: buttonStyle()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
