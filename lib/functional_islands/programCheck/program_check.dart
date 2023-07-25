import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../tools/styles.dart';

class ProgramCheck extends StatefulWidget {
  final Color themeColor;

  const ProgramCheck({Key? key, required this.themeColor}) : super(key: key);

  @override
  State<ProgramCheck> createState() => _ProgramCheckState();
}

class _ProgramCheckState extends State<ProgramCheck> {
  double programSize = 1;
  bool showEntry = false;
  List<String> targets = [];
  List<Widget> buttons = [];

  @override
  void initState() {
    super.initState();
    getList();
  }

  void programPressed() {
    setState(() {
      showEntry = !showEntry;
      programSize = showEntry ? 3 : 1;
      getList();
    });
  }

  Future<void> getList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    targets = prefs.getStringList('targets') ?? [];
    prepareLists();
  }

  void prepareLists() {
    buttons = [];
    bool pressed = false;
    for (int i = 0; i < targets.length; i++) {
      buttons.add(
        Column(
          children: [
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                setState(() {
                  pressed = !pressed;
                  print("ss$pressed");
                });
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: pressed ? Colors.red : Colors.green,
                  borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    targets[i],
                    style: const TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          height: 100 * programSize,
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.themeColor,
            borderRadius: const BorderRadius.all(Radius.circular(32.0)),
          ),
          child: TextButton(
            onPressed: programPressed,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Program checkkkk",
                    style: quoteStyle(),
                  ),
                  Visibility(
                    visible: showEntry,
                    child: Column(
                      children: [
                        ...(buttons),
                      ],
                    ),
                  ),
                ],
              ),
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
