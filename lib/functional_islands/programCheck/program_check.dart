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

  prepareLists() {
    buttons = [];
    //todo bunu işte widgetla

    for (int i = 0; targets.length > i; i++) {

      buttons.add(Container(
        width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),

        child: TextButton(
          onPressed: () {},
          child: Text(targets[i]),
        ),
      ),);
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
